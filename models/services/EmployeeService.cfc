component name="EmployeeService"singleton accessors="true"{

	// Properties
    property name="EmployeeGateway" inject="model:EmployeeGateway";
	
	/**
	 * Constructor
	 */
	EmployeeService function init(){

		return this;
	}

	// Selects all employees
	function getAllEmployees(){

        var getAllEmployees = EmployeeGateway.getAllEmployees();
        return getAllEmployees;
    }

	// Selects a single employee
	function getOneEmployee(intEmployeeID){

        var getOneEmployee = EmployeeGateway.getOneEmployee(intEmployeeID);
        return getOneEmployee;
    }

	// Function chain will run insert query
	function save(anEmployee, crudAction) {

		if (crudAction == "Create") {
			EmployeeGateway.create(anEmployee);
		} else if (crudAction == "Update") {
			EmployeeGateway.update(anEmployee);
		} else {
			EmployeeGateway.delete(anEmployee);
		}
        return;
    }


}