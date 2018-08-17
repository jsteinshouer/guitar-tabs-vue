/**
* Tablature Service Test Suite
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
		// all your suites go here.
		describe( "Tablature Service Test Suite", function(){

			beforeEach(function( currentSpec ){
				mockEntityService = createMock( "cborm.models.VirtualEntityService" );
				mockTablatureEntity = createMock( "models.tablature.Tablature" );
				tablatureService = new models.tablature.TablatureService( entityService = mockEntityService );
			});

			describe( "getByID()", function(){
			
				beforeEach(function( currentSpec ){
					mockEntityService.$( "get" ).$args(22).$results( mockTablatureEntity );
				});

				
				it( "should return a collection of all tablature entities", function(){
					var result = tablatureService.getByID(22);
					
					expect(	mockEntityService.$once( "get") ).toBeTrue();
					expect(	result ).toBe( mockTablatureEntity );
					
				});
			
			});

			
			describe( "getAll()", function(){
			
				beforeEach(function( currentSpec ){
					mockEntityService.$( "getAll", [ mockTablatureEntity, duplicate(mockTablatureEntity) ]  );
				});

				
				it( "should return a collection of all tablature entities", function(){
					var result = tablatureService.getAll();
					
					expect(	mockEntityService.$once( "getAll") ).toBeTrue();
					expect(	result.len() ).toBe( 2 );
					
				});
			
			});

			describe( "newEntity()", function(){

				beforeEach(function( currentSpec ){
					mockEntityService.$( "new", mockTablatureEntity );
				});
				
				it( "should return a new Tablature entity", function(){
					
					var entity = tablatureService.newEntity();

					expect(	entity ).toBe( mockTablatureEntity );

				});
			
			});

			describe( "saveEntity()", function(){

				beforeEach(function( currentSpec ){
					mockEntityService.$( "save", mockTablatureEntity );
				});
				
				it( "should save Tablature entity", function(){
					
					tablatureService.saveEntity( mockTablatureEntity );

					expect(	mockEntityService.$once( "save" ) ).toBeTrue();

				});
			
			});

		});
	}
	
}