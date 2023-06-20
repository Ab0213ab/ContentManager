component name="Company" accessors="true" {

    property type="Numeric" name="intCompanyKey" getter=true;
    property type="String" name="vcCompanyName" getter=true;
    property type="boolean" name="bitIsActive" getter=true;

    function init() {

        this.intCompanyKey = 0;
        this.vcCompanyName = "";
        this.bitIsActive = false;
        
        return this;
    }
}