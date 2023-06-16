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

	// Function chain will run query
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
	

	function getSuccessMessage(crudAction) {

		prc.successMessage = "";
	
		switch (crudAction) {
			case "Create":
				prc.successMessage = "Your new company was successfully created.";
				break;
			case "Update":
				prc.successMessage = "Your company was successfully updated.";
				break;
			case "Delete":
				prc.successMessage = "Your company was successfully deleted.";
				break;
		}	
		return prc.successMessage;
	}


	function getEmptyDomain() {

		return new models.domains.Company();
	}


/***********************************************************************************************************************************************/
/***********************************************************************************************************************************************/


	// Experimental...

	function createSave(aCompany) {
		CompanyGateway.create(aCompany);
	}

	function updateSave(aCompany) {
		CompanyGateway.update(aCompany);
	}

	function deleteSave(aCompany) {
		CompanyGateway.delete(aCompany);
	}


}