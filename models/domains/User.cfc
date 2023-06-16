component name="User" accessors="true" {

    property type="Numeric" name="intUserID" getter=true;
    property type="String" name="vcUserName" getter=true;
    property type="String" name="vcPassword" getter=true;
    property type="boolean" name="bitIsActive" getter=true;
    property type="boolean" name="bitIsAdmin" getter=true;

    function init() {

        this.intUserID = 0;
        this.vcUserName = "";
		this.vcPassword = "";
        this.bitIsActive = false;
        this.bitIsAdmin = false;
        return this;
    }

}