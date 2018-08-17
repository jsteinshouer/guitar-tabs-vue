/**
* Tablature Service
*/
component singleton="true"{

	/**
	* Constructor
	* 
	* entityService.hint CBORM Virtual Entity Service
	* 
	*/
	function init(
		cborm.models.VirtualEntityService entityService = new cborm.models.VirtualEntityService("Tablature")
	) {

		variables.entityService = arguments.entityService;

		return this;
	}

	/**
	* Get a tablature entity by id
	*/
	public models.tablature.Tablature function getByID( required numeric tablatureID ){
		return entityService.get( arguments.tablatureID );
	}

	/**
	* Return all tablature entities
	*/
	public array function getAll(){
		return entityService.getAll();
	}

	/**
	* Create and return a new tablature entity
	*/
	public models.tablature.Tablature function newEntity(){
		return entityService.new();
	}

	/**
	* Save a tablature entity
	*/
	public void function saveEntity( required models.tablature.Tablature tablature ){
		entityService.save( tablature );
	}

}