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


	function buildReadForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "disabled";
		form.btnEnabled = "disabled";
		form.btnIcon = "bi bi-book";
		form.btnClass = "btn btn-primary mt-2";
		form.crudAction = "Read Only";
		form.formTitle = "View Employee";

        // Populates the company dropdown in the add form
        form.allCompanies = CompanyService.getAllCompanies();

        form.oneEmployee = getOneEmployee(rc.intEmployeeID);

		return form;
	}


	function buildCreateForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "";
		form.btnEnabled = "";
		form.btnIcon = "bi bi-person-plus";
		form.btnClass = "btn btn-primary mt-2";
		form.crudAction = "Create";
		form.formTitle = "Add Employee";

		form.oneEmployee = getEmptyDomain();

		// Populates the company dropdown in the add form
        form.allCompanies = CompanyService.getAllCompanies();

		return form;
	}


	function buildUpdateForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "";
		form.btnEnabled = "";
		form.btnIcon = "bi bi-pen";
		form.btnClass = "btn btn-primary mt-2";
		form.crudAction = "Update";
		form.formTitle = "Edit Employee";

		// Populates the company dropdown in the add form
        form.allCompanies = CompanyService.getAllCompanies();

		form.oneEmployee = getOneEmployee(prc.intEmployeeID);
		
		return form;
	}

	function buildDeleteForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "disabled";
        form.btnEnabled = "";
        form.btnIcon = "bi bi-person-x-fill";
        form.btnClass = "btn btn-danger mt-2";
        form.crudAction = "Delete";
        form.formTitle = "Delete Employee";

		// Populates the company dropdown in the add form
        form.allCompanies = CompanyService.getAllCompanies();

		form.oneEmployee = getOneEmployee(prc.intEmployeeID);

		return form;
	}


}