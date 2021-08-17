/**
* Tab Test
*/
component extends="testbox.system.BaseSpec"{
	
/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
		
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
		
	}

/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){

		describe( "Tab Test", function() {

			beforeEach(function( currentSpec ){
				
			});

			it( "should have a title property", function(){
				var tab = new models.entities.Tab();

				var myTestTitle = "My Tab";

				tab.setTitle( myTestTitle );

				expect(	tab.getTitle() ).toBe( myTestTitle );
			});

			it( "should have a content property", function(){
				var tab = new models.entities.Tab();

				var myTestContent = "Some test content";

				tab.setContent( myTestContent );

				expect(	tab.getContent() ).toBe( myTestContent );
			});

		});

	}
	
}