/**
*
* Base Entity
*
*/
component {

	/**
	*
	* Constructor
	*
	*/
	public any function init() {

		initProperties(argumentCollection=arguments);
		
		return this;
	}


	/**
	*
	* Get a memento
	*
	*/
	public any function getMemento(string filter = "", string exclude = "", numeric depth = 1) {

		var oMetadata = getMetaData( this );
		var stInstance = {};

		/* Loop through properties */
		for(var item in oMetadata.properties) {
			if (!len(arguments.filter) || listContainsNoCase(arguments.filter, item.name)) {
				/* Make sure property is not null or excluded */
				if (!isNull(variables[item.name]) && !listContainsNoCase(arguments.exclude, item.name)) {
					/* If it is an object get memento */
					if ( isObject(variables[item.name]) ) {
						if ( arguments.depth ) {
							arguments.depth = arguments.depth - 1;
							stInstance[item.name] = variables[item.name].getMemento(argumentCollection=arguments);
						}
					}
					else {
						stInstance[item.name] = variables[item.name];
					}
				}
			}
		}
		
		return stInstance;
	}

	/**
	*
	* Get the created date
	*
	*/
	public any function getCreatedDate() {
		
		return isNull(createdDate) ? "" : dateTimeFormat(createdDate,"short");
	}

	/**
	*
	* Get the modified date
	*
	*/
	public any function getModifiedDate() {
		
		return isNull(modifiedDate) ? "" : dateTimeFormat(modifiedDate,"short");
	}

	/**
	*
	* Initialize bean properties
	*
	*/
	private void function initProperties() {

		var oMetadata = getMetaData( this );
		var bHasDefault = false;
		
		/* Loop through all properties and see if a matching argument was passed */
		for (var stProp in oMetadata.properties) {
			if (structKeyExists(arguments, stProp.name)) {
				variables[stProp.name] = arguments[stProp.name];
			}
			/* Set defaults */
			else {
				/* if wirebox inject is present then leave alone */
				if (!structKeyExists(stProp, "inject")) {
					/* Use default set for the property */
					if (structKeyExists(stProp, "default")) {
						bHasDefault = true;
					}
					else {
						bHasDefault = false;
					}

					/* Set default value */
					if (structKeyExists(stProp, "type")) {
						switch(stProp.type){
							case "string":
								variables[stProp.name] = bHasDefault ? stProp.default : "";
							break;
							case "boolean":
								variables[stProp.name] = (bHasDefault && isBoolean(stProp.default)) ? (stProp.default) : true;
							break;
							case "numeric":
								if (structKeyExists(stProp, "ormType") && stProp.ormType == "int") {
									variables[stProp.name] = (bHasDefault && isNumeric(stProp.default)) ? javaCast("int",stProp.default) : javaCast("int",0);
								}
								else {
									variables[stProp.name] = (bHasDefault && isNumeric(stProp.default)) ? val(stProp.default) : 0;
								}
							break;
							case "struct":
								// variables[stProp.name] = bHasDefault ? evaluate(stProp.default) : {};
								variables[stProp.name] = {};
							break;
							case "array":
								// variables[stProp.name] = (bHasDefault && isArray(stProp.default)) ? evaluate(stProp.default) : [];
								variables[stProp.name] = [];
							break;
							// default:
							// 	variables[stProp.name] = "";
							// break;
						}
					}

				}
			}
		}

	}


}
