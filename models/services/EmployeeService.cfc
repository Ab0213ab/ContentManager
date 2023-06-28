component name="EmployeeService"singleton accessors="true"{

	// Properties
    property name="EmployeeGateway" inject="model:EmployeeGateway";
	property name="CompanyService" inject="model:CompanyService";
	
	/**
	 * Constructor
	 */
	EmployeeService function init() {

		return this;
	}

	// Selects all employees
	function getAllEmployees() {

        var getAllEmployees = EmployeeGateway.getAllEmployees();
        return getAllEmployees;
    }

	function getAllEmployeesFirstNames() {

		 var getAllEmployeesFirstNames = EmployeeGateway.getAllEmployeesFirstNames();
		 return getAllEmployeesFirstNames;
	}

	// Selects a single employee
	function getOneEmployee(intEmployeeID) {

        var getOneEmployee = EmployeeGateway.getOneEmployee(intEmployeeID);
        return getOneEmployee;
    }


	function validate(anEmployee) {

		prc.errorMessages = [];

		if (trim(anEmployee.getVcLastName()) === "" || REFind("^(?!$)[A-Za-z\s]+$", trim(anEmployee.getVcLastName())) == 0) {
			arrayAppend(prc.errorMessages, "Employee Last Name field is required and only accepts letters.")
		}

		if (trim(anEmployee.getVcFirstName()) === "" || REFind("^(?!$)[A-Za-z\s]+$", trim(anEmployee.getVcFirstName())) == 0) {
			arrayAppend(prc.errorMessages, "Employee first Name field is required and only accepts letters.")
		}

		if (trim(anEmployee.getVcRegion()) === "" || REFind("^(?!$)[A-Za-z\s]+$", trim(anEmployee.getVcRegion())) == 0) {
			arrayAppend(prc.errorMessages, "Employee region field is required and only accepts letters.")
		}

		if (trim(anEmployee.getVcCity()) === "" || REFind("^(?!$)[A-Za-z\s]+$", trim(anEmployee.getVcCity())) == 0) {
			arrayAppend(prc.errorMessages, "Employee city field is required and only accepts letters.")
		}

		if (trim(anEmployee.getVcHomePhone()) === "" || REFind("^[0-9\s]*$", trim(anEmployee.getVcHomePhone())) == 0) {
			arrayAppend(prc.errorMessages, "Employee home phone field is required and only accepts numbers.")
		}

		return prc.errorMessages;
	}


	function getEmptyDomain() {

		return new models.domains.Employee();
	}

	function save(anEmployee) { 

		if (anEmployee.getIntEmployeeID() == 0) {
			EmployeeGateway.create(anEmployee);
		} else {
			EmployeeGateway.update(anEmployee);
		}
		
	}

	function delete(anEmployee) {

		EmployeeGateway.delete(anEmployee);
		session.successMessage = "Your employee was successfully deleted."

	}


}