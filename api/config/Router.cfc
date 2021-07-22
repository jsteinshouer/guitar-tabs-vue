component{

	function configure(){
		setFullRewrites( true );

		resources( "tablature" );

		route(pattern=".*",handler="Main",action="index").end();
	}

}