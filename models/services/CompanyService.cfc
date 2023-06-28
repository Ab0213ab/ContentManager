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


	function delete(aCompany) {

		CompanyGateway.delete(aCompany);
		session.successMessage = "Your company was successfully deleted."

	}
	

	function validate(aCompany) {
		
		prc.errorMessages = [];
	
		if (trim(aCompany.getVcCompanyName()) == "") {
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


	function save(aCompany) { 

		if (aCompany.getIntCompanyKey() == 0) {
			CompanyGateway.create(aCompany);
		} else {
			CompanyGateway.update(aCompany);
		}	
	}
	


}