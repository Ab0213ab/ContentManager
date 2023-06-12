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

	function validate(aCompany) {

		prc.errorMessage = [];

		if (aCompany.getVcCompanyName() == "") {
			arrayAppend(prc.errorMessage, "Company Name field is required.")
		}
		if (aCompany.getBitIsActive() == "") {
			arrayAppend(prc.errorMessage, "Is Active field is required.")
		}
		
		return prc.errorMessage;
	}


}