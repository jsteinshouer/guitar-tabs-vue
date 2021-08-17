/**
* My RESTFul Event Handler
*/
component extends="BaseHandler"{

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
		prc.response.setData( getInstance( "Tab" ).asMemento().all() );
	}


	/**
	* Read a
	*/
	any function show( event, rc, prc ){
		prc.response.setData( 
			getInstance( "Tab" )
				.findOrFail( rc.id )
				.getMemento()
		);
	}

	/**
	* Create a new tablature
	*/
	any function create( event, rc, prc ){

		var tab = getInstance( "Tab" ).create( {
			"title": rc.title,
			"content": rc.content
		});

		prc.response.setData( tab.getMemento() );
		prc.response.setStatusCode( 201 );
	}

	/**
	* Delete a tablature record
	*/
	any function delete( event, rc, prc ){

		getInstance( "Tab" )
				.findOrFail( rc.id )
				.delete();

		prc.response.setStatusCode( 200 );
	}

}