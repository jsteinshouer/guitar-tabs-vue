/*******************************************************************************
*	Integration Test as BDD (CF10+ or Railo 4.1 Plus)
*
*	Extends the integration class: coldbox.system.testing.BaseTestCase
*
*	so you can test your ColdBox application headlessly. The 'appMapping' points by default to
*	the '/root' mapping created in the test folder Application.cfc.  Please note that this
*	Application.cfc must mimic the real one in your root, including ORM settings if needed.
*
*	The 'execute()' method is used to execute a ColdBox event, with the following arguments
*	* event : the name of the event
*	* private : if the event is private or not
*	* prePostExempt : if the event needs to be exempt of pre post interceptors
*	* eventArguments : The struct of args to pass to the event
*	* renderResults : Render back the results of the event
*******************************************************************************/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/root"{

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		// do your own stuff here
	}

	function afterAll(){
		// do your own stuff here
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){

		describe( "Test Tablature Resource", function(){

			beforeEach(function( currentSpec ){
				// Setup as a new ColdBox request, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			});

			aroundEach( function( spec, suite ){

				transaction {

					// execute the spec
			     	arguments.spec.body();

			     	ormflush();

			     	transaction action="rollback";
				}

			} );

			describe( "GET /tablatures/:id", function(){

				it( "should get a tab", function(){

					var tab = entityNew("Tablature").setTitle("My Tab Title").setContent("test content")

					entitySave( tab );

					var event = get( route = "tablature/" & tab.getTablatureID()  );

					var response 	= event.getPrivateValue( "response" );
					expect(	response.getStatusCode() ).toBe( 200 );
					expect(	response.getData().getTablatureID() ).toBe( tab.getTablatureID() );
					expect(	response.getData().getTitle() ).toBe( "My Tab Title" );
					expect(	response.getData().getContent() ).toBe( "test content" );

				});

			});


			describe( "GET /tablatures", function(){

				// beforeEach(function( currentSpec ){
				// 	queryExecute("delete from tablature;")
				// });


				it( "should list existing tabs", function(){

					entitySave( entityNew("Tablature").setTitle("test 1").setContent("test 1") );
					entitySave( entityNew("Tablature").setTitle("test 2").setContent("test 2") );

					var event = get( route = "tablature" );

					var response 	= event.getPrivateValue( "response" );
					expect(	response.getStatusCode() ).toBe( 200 );
					expect(	response.getData().len() ).toBe( 2 );
					expect(	response.getData()[1].getContent() ).toBe( "test 1" );

				});

			});


			describe( "POST /tablature", function(){

				it( "should create a new tab", function(){

					var event = post(
						route = "tablature",
						params = {
							title = "Test Tab Title",
							content = "Some Tab Content"
						}
					);

					var response 	= event.getPrivateValue( "response" );
					expect(	response.getStatusCode() ).toBe( 201 );
					expect(	response.getData().tablatureID ).toBeGT( 0 );
					expect(	response.getData().title ).toBe( "Test Tab Title" );
					expect(	response.getData().content ).toBe( "Some Tab Content" );
				});

			});

			describe( "DELETE /tablature", function(){

				it( "should delete tab record", function(){

					var testTab = entityNew("Tablature").setTitle("test 1").setContent("test 1");
					entitySave( testTab );
					expect(	entityLoad("Tablature").len() ).toBe( 1 );

					var event = delete(
						route = "tablature/#testTab.getTablatureID()#"
					);

					var response 	= event.getPrivateValue( "response" );

					ormFlush();
					expect(	response.getStatusCode() ).toBe( 200 );
					expect(	entityLoad("Tablature").len() ).toBe( 0 );
				});

			});


		});

	}

}