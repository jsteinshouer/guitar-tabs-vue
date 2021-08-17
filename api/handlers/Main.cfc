/**
* My RESTFul Event Handler
*/
component extends="coldbox.system.EventHandler" {
	
	/**
	* Index
	*/
	any function index( event, rc, prc ){
		event.setView(view="main/index",noLayout=true);
	}

	/**
	* Run when app starts
	*/
	any function onAppStart( event, rc, prc ) {
		getInstance( "MigrationService@cfmigrations" ).runAllMigrations( "up" ) 
	}
	
}