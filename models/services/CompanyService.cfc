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


}