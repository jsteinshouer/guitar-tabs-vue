/**
* Tablature Bean
*/
component persistent="true" accessors="true" extends="models.BaseEntity" table="tablature" {

	property name="tablatureID" column="p_tablature" ormType="int" fieldtype="id" generator="identity";
	property name="title" column="title" ormType="string" length="50" type="string";
	property name="content" column="content" ormType="text";

	/**
	* Constructor
	*/
	function init(){

		super.init();

		return this;
	}

}