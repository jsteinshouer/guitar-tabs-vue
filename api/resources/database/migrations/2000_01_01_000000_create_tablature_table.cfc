component {

	function up( schema, query ){
		schema.create( "tablature", function(table) {
			table.increments( "p_tablature" );
			table.string( "title" );
			table.text( "content" );
		} );
	}

	function down( schema, query ){
		schema.drop( "tablature" );
	}

}
