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

		if (REFind("^(?!$)[A-Za-z\s]+$", trim(anEmployee.getVcLastName())) == 0) {
			arrayAppend(prc.errorMessages, "Employee Last Name field only accepts letters.")
		}
		if (trim(anEmployee.getVcLastName()) == "") {
			arrayAppend(prc.errorMessages, "Employee Last Name field is required.")
		}

		if (REFind("^(?!$)[A-Za-z\s]+$", trim(anEmployee.getVcFirstName())) == 0) {
			arrayAppend(prc.errorMessages, "Employee First Name field only accepts letters.")
		}
		if (trim(anEmployee.getVcFirstName()) == "") {
			arrayAppend(prc.errorMessages, "Employee First Name field is required.")
		}

		if (REFind("^[A-Za-z\s]*$", trim(anEmployee.getVcRegion())) == 0) {
			arrayAppend(prc.errorMessages, "Employee Region field only accepts letters.")
		}
		if (trim(anEmployee.getVcRegion()) == "") {
			arrayAppend(prc.errorMessages, "Employee Region field is required.")
		}

		if (REFind("^[A-Za-z\s]*$", trim(anEmployee.getVcCity())) == 0) {
			arrayAppend(prc.errorMessages, "Employee City field only accepts letters.")
		}
		if (trim(anEmployee.getVcCity()) == "") {
			arrayAppend(prc.errorMessages, "Employee City field is required.")
		}

		if (REFind("^[0-9\s]*$", trim(anEmployee.getVcHomePhone())) == 0) {
			arrayAppend(prc.errorMessages, "Employee Home Phone field only accepts numbers.")
		}
		if (trim(anEmployee.getVcHomePhone()) == "") {
			arrayAppend(prc.errorMessages, "Employee Home Phone field is required.")
		}

		return prc.errorMessages;
	}
	

	function getSuccessMessage(anEmployee) {

		if (anEmployee.getIntEmployeeID() > 0) {
			prc.successMessage = "Your employee was successfully updated.";
		} else {
			prc.successMessage = "Your employee was successfully created.";
		}
	
		return prc.successMessage;
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