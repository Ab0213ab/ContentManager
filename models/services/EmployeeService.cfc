component name="EmployeeService"singleton accessors="true"{

	// Properties
    property name="EmployeeGateway" inject="model:EmployeeGateway";
	
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

	// Function chain will run insert query
	function save(anEmployee, crudAction) {

		if (crudAction == "Create") {
			EmployeeGateway.create(anEmployee);
		} else if (crudAction == "Update") {
			EmployeeGateway.update(anEmployee);
		} else if (crudAction == "Delete") {
			EmployeeGateway.delete(anEmployee);
		}
        return;
    }
/*******************************************************************/
	function validate(anEmployee) {

		prc.errorMessages = [];

		if (REFind("^(?!$)[A-Za-z\s]+$", anEmployee.getVcLastName()) == 0) {
			arrayAppend(prc.errorMessages, "Employee Last Name field only accepts letters.")
		}
		if (REFind("^(?!$)[A-Za-z\s]+$", anEmployee.getVcFirstName()) == 0) {
			arrayAppend(prc.errorMessages, "Employee First Name field only accepts letters.")
		}
		if (REFind("^[A-Za-z\s]*$", anEmployee.getVcRegion()) == 0) {
			arrayAppend(prc.errorMessages, "Employee Region field only accepts letters.")
		}
		if (REFind("^[A-Za-z\s]*$", anEmployee.getVcCity()) == 0) {
			arrayAppend(prc.errorMessages, "Employee City field only accepts letters.")
		}
		if (REFind("^[0-9\s]*$", anEmployee.getVcHomePhone()) == 0) {
			arrayAppend(prc.errorMessages, "Employee Home Phone field only accepts numbers.")
		}
		return prc.errorMessages;
	}

}