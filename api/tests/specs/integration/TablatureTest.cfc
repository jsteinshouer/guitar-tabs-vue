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
		//getInstance( "MigrationService@cfmigrations" ).runAllMigrations( "up" );
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

			     	transaction action="rollback";
				}

			} );

			describe( "GET /tablatures/:id", function(){

				it( "should get a tab", function(){

					var tab = getInstance( "Tab" ).create( {
						"title": "My Tab Title",
						"content": "test content"
					});

					var event = get( route = "tablature/" & tab.getID()  );

					
					var response 	= event.getPrivateValue( "response" );
					expect(	response.getStatusCode() ).toBe( 200 );
					expect(	response.getData().id ).toBe( tab.getID() );
					expect(	response.getData().title ).toBe( "My Tab Title" );
					expect(	response.getData().content ).toBe( "test content" );

				});

			});


			describe( "GET /tablatures", function(){

				it( "should list existing tabs", function(){

					var tab = getInstance( "Tab" );

					var tabCount = tab.all().len();
					tab.create( {
						"title": "Test 1",
						"content": "test 1"
					});
					tab.create( {
						"title": "Test 2",
						"content": "test 2"
					});

					var event = get( route = "tablature" );

					var response 	= event.getPrivateValue( "response" );
					expect(	response.getStatusCode() ).toBe( 200 );
					expect(	response.getData().len() ).toBe( tabCount + 2 );
					expect(	response.getData()[tabCount + 1].content ).toBe( "test 1" );

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
					expect(	response.getData().id ).toBeGT( 0 );
					expect(	response.getData().title ).toBe( "Test Tab Title" );
					expect(	response.getData().content ).toBe( "Some Tab Content" );
				});

			});

			describe( "DELETE /tablature", function(){

				it( "should delete tab record", function(){

					var testTab = getInstance( "Tab" ).create( {
						"title": "Test 1",
						"content": "test 1"
					});

					var event = delete(
						route = "tablature/#testTab.getID()#"
					);

					var response 	= event.getPrivateValue( "response" );

					expect(	response.getStatusCode() ).toBe( 200 );
					expect(	getInstance( "Tab" ).find( testTab.getID() ) ).toBeNull();
				});

			});


		});

	}

}