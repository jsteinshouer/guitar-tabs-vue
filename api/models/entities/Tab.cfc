/**
* Tablature Bean
*/
component extends="quick.models.BaseEntity" accessors="true" table="tablature" {

	property name="id" column="p_tablature";
	property name="title" column="title";
	property name="content" column="content";

	//Overide default to provide tablatureID
	function getMemento() {
        return {
            "id" = getId(),
            "tablatureID" = getId(),
            "title" = getTitle(),
            "content" = getContent()
        };
    }

}