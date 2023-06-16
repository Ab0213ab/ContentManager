component name="Employee" accessors="true" {

    property type="Numeric" name="intEmployeeID" getter=true;
    property type="String" name="vcLastName" getter=true;
    property type="String" name="vcFirstName" getter=true;
    property type="String" name="vcTitle" getter=true;
    property type="String" name="vcTitleOfCourtesy" getter=true;
    property type="String" name="dtBirthDate" getter=true;
    property type="String" name="dtHireDate" getter=true;
    property type="String" name="vcAddress" getter=true;
    property type="String" name="vcCity" getter=true;
    property type="String" name="vcRegion" getter=true;
    property type="String" name="vcPostalCode" getter=true;
    property type="String" name="vcCountry" getter=true;
    property type="String" name="vcHomePhone" getter=true;
    property type="String" name="vcExtension" getter=true;
    property type="String" name="vcNotes" getter=true;
    property type="Numeric" name="intCompanyKey" getter=true;

    function init() {

        this.intEmployeeID = 0;
        this.vcFirstName = "";
		this.vcLastName = "";
		this.vcTitle = "";
		this.vcTitleOfCourtesy = "";
		this.dtBirthDate = "";
		this.dtHireDate = "";
		this.vcAddress = "";
		this.vcCity = "";
		this.vcRegion = "";
		this.vcPostalCode = "";
		this.vcCountry = "";
		this.vcHomePhone = "";
		this.vcExtension = "";
		this.vcNotes = "";
    }
}