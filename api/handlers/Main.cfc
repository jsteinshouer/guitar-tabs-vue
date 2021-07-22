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
	
}