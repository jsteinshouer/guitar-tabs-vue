/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
*/
component{

	// APPLICATION CFC PROPERTIES
	this.name 				= "ColdBoxTestingSuite" & hash(getCurrentTemplatePath());
	this.sessionManagement 	= true;
	this.sessionTimeout 	= createTimeSpan( 0, 0, 15, 0 );
	this.applicationTimeout = createTimeSpan( 0, 0, 15, 0 );
	this.setClientCookies 	= true;

	// Create testing mapping
	this.mappings[ "/tests" ] = getDirectoryFromPath( getCurrentTemplatePath() );
	// Map back to its root
	rootPath = REReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
	this.mappings["/root"]   = rootPath;
	this.mappings["/models"]   = rootPath & "/models";

	this.datasources["TABS"] = {
		  class: 'org.h2.Driver'
		, connectionString: 'jdbc:h2:#rootPath#/.data/tabs_test;MODE=MSSQLServer'
	};

	this.datasource = "TABS";

	this.ormEnabled = true;
	this.ormSettings.dbcreate = "dropcreate";
	this.ormSettings.cfclocation = ["/models"];

}