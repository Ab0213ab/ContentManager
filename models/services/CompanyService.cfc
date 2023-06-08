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


}