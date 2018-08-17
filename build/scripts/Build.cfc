/**
* Build script
*/
component{

	/**
	* Constructor
	*/
	function init() {

		variables.WORK_DIR  = fileSystemUtil.resolvePath( "." );
		variables.CLIENT_DIR = WORK_DIR & "/client-app";
		variables.CLIENT_DIST_DIR = WORK_DIR & "/client-app/dist";
		variables.ASSET_DIR = WORK_DIR & "/assets";
		variables.DEFAULT_VIEW_FILE = WORK_DIR & "/views/main/index.cfm";

		return this;
	}

	/**
	* Run
	*/
	function run() {
		buildClient();
	}

	
	/**
	* Build the client application and integrate it with Colbox
	*/
	function buildClient() {
		
		job.start("Running client build");
		
		runVueCLIBuild();
		cleanAssets();
		copyAssets();
		copyIndex();
		job.complete();
		
	}

	/**
	* Runs the client build script with NPM
	*/
	function runVueCLIBuild() {
		job.start("npm run build");
		command("!npm run build")
			.inWorkingDirectory( CLIENT_DIR )
			.run();
		job.complete();
	}

	/**
	* Clean the assets directory
	*/
	function cleanAssets() {
		
		job.start("Clean assets");
		if ( directoryExists( ASSET_DIR & "/css" ) ) {
			directoryDelete( ASSET_DIR & "/css", true );
		}

		if ( directoryExists( ASSET_DIR & "/js" ) ) {
			directoryDelete( ASSET_DIR & "/js", true );
		}
		job.complete();

	}

	/**
	* Copy assets from from client directory to the Coldbox assets directory
	*/
	function copyAssets() {
		job.start("Copying assets");
		directoryCopy( CLIENT_DIST_DIR & "/assets/css", ASSET_DIR & "/css" );
		directoryCopy( CLIENT_DIST_DIR & "/assets/js", ASSET_DIR & "/js" );
		job.complete();
	}

	/**
	* Copy the client index file to the default Coldbox view
	*/
	function copyIndex() {
		job.start("Copying index");
		if ( fileExists( DEFAULT_VIEW_FILE ) ) {
			fileDelete (DEFAULT_VIEW_FILE );
		}

		fileCopy( CLIENT_DIST_DIR & "/index.html", DEFAULT_VIEW_FILE );
		job.complete();
	}
	

}
