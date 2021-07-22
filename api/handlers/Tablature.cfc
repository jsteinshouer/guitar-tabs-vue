/**
* My RESTFul Event Handler
*/
component extends="BaseHandler"{

	property name="tablatureService" inject="tablature.TablatureService";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.posthandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = { };

	/**
	* Index
	*/
	any function index( event, rc, prc ){
		prc.response.setData( tablatureService.getAll() );
	}


	/**
	* Read a
	*/
	any function show( event, rc, prc ){
		prc.response.setData( tablatureService.getByID( rc.id ) );
	}

	/**
	* Create a new tablature
	*/
	any function create( event, rc, prc ){

		var tab = tablatureService.newEntity();
		populateModel( model = tab );

		tablatureService.saveEntity( tab );
		prc.response.setData( tab.getMemento() );
		prc.response.setStatusCode( 201 );
	}

	/**
	* Delete a tablature record
	*/
	any function delete( event, rc, prc ){

		var tab = tablatureService.getByID( rc.id );

		tablatureService.deleteEntity( tab );
		prc.response.setStatusCode( 200 );
	}

}