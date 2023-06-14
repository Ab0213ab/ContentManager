component singleton accessors="true"{

	// Properties
    property name="CompanyGateway" inject="model:CompanyGateway";
	
	/**
	 * Constructor
	 */
	CompanyService function init(){

		return this;
	}

	// For selecting all companies
	function getAllCompanies(){

        var getAllCompanies = CompanyGateway.getAllCompanies();
        return getAllCompanies;
    }

	// For selecting all companies and their associated employees
	function getEmployeesByCompanyKey(intCompanyKey){

		var employeesByCompanyKey = CompanyGateway.getEmployeesByCompanyKey(intCompanyKey);
		return employeesByCompanyKey;
	}

	function getOneCompany(intCompanyKey) {

		var getOneCompany = CompanyGateway.getOneCompany(intCompanyKey);
        return getOneCompany;
	}

	// Function chain will run insert query
	function save(aCompany, crudAction) {

		if (crudAction == "Create") {
			CompanyGateway.create(aCompany);
		} else if (crudAction == "Update") {
			CompanyGateway.update(aCompany);
		} else if (crudAction == "Delete") {
			CompanyGateway.delete(aCompany);
		}
		return;
	}

	function validate(aCompany, crudAction) {

		prc.errorMessages = [];

		if (crudAction == "Delete") {
			return prc.errorMessages;
		}

		if (aCompany.getVcCompanyName() == "") {
			arrayAppend(prc.errorMessages, "Company Name field is required.")
		}
		if (aCompany.getBitIsActive() == "") {
			arrayAppend(prc.errorMessages, "Is Active field is required.")
		}
		
		return prc.errorMessages;
	}

	function getEmptyDomain() {

		return new models.domains.Company();
	}

	// To fill in form values on creates
	function createEmptyCompany() {

		prc.oneCompany = getEmptyDomain();
        prc.oneCompany.intCompanyKey = 0;
        prc.oneCompany.vcCompanyName = "";

		return prc.oneCompany;
	}


}