component extends="coldbox.system.EventHandler" {

    property name="EmployeeService" inject="model:EmployeeService";
    property name="EmployeeGateway" inject="model:EmployeeGateway";
    property name="CompanyService" inject="model:CompanyService";

    // IS CURRENTLY USING INTERCEPTOR, BUT THIS ALSO WORKS.
    // TODO: ASK PAUL WHICH IS THE BEST METHOD
    // Checks if the user is logged in 
    function preHandler(event,rc,prc) {

		if (NOT session.keyExists("isLoggedIn") OR NOT session.isLoggedIn) {
			
			// Redirect the user to the login page
            // Should use relocate instead of this ->
			event.overrideEvent("main.index");
		}
	 }

    function index() {

        prc.welcomeMessage = "Welcome, #session.vcUserName#!";
        prc.allEmployees = EmployeeService.getAllEmployees();

        // For post CRUD action from employee/save()
        prc.message = event.getValue("message", "");

        // Exit Handlers
        prc.xeh.readEmployee = "employee/readEmployee";
        prc.xeh.createEmployee = "employee/createEmployee";
        prc.xeh.updateEmployee = "employee/updateEmployee";
        prc.xeh.deleteEmployee = "employee/deleteEmployee";
        
        event.setView( "employee/index" );
    }


    function readEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/save";

        // For form fields
        prc.fieldsEnabled = "disabled";
        // For action button
        prc.btnEnabled = "disabled";
        prc.btnIcon = "bi bi-book";

        prc.crudAction = "Read Only";
        prc.formTitle = "View Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        prc.oneEmployee = EmployeeService.getOneEmployee(rc.intEmployeeID);

        event.setView( "employee/employeeCrud" );
    }


    function createEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/save";

        // For form fields
        prc.fieldsEnabled = "";
        // For action button
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-person-plus";

        prc.crudAction = "Create";
        prc.formTitle = "Add Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        event.setView( "employee/employeeCrud" );
    }


    function updateEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/save";

        // For form fields
        prc.fieldsEnabled = "";
        // For action button
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-pen";

        prc.crudAction = "Update";
        prc.formTitle = "Edit Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        if (structKeyExists(rc, "intEmployeeID")) {
            prc.oneEmployee = EmployeeService.getOneEmployee(rc.intEmployeeID);
        } 

        event.setView( "employee/employeeCrud" );

    }

    function deleteEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/save";

        // For form fields
        prc.fieldsEnabled = "disabled";
        // For action button
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-person-x-fill";

        prc.crudAction = "Delete";
        prc.formTitle = "Delete Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        prc.intEmployeeID = event.getValue("intEmployeeID", "");
        prc.oneEmployee = EmployeeService.getOneEmployee(prc.intEmployeeID);

        event.setView( "employee/employeeCrud" );
    }

    // Ensures required fields have data
    function validateEmpFormReqFields(vcLastName, vcFirstName) {

        isValid = true;
        if (vcLastName == "" || vcFirstName == "") {
            isValid = false;
        }
        return isValid;
    }

    // Determines which CRUD action to take
    function save(event, rc, prc) {

        prc.anEmployee = new models.domains.Employee();

        // Sets properties with form values
        if (IsNumeric(rc.intEmployeeID)) {
            prc.anEmployee.setIntEmployeeID(rc.intEmployeeID);
        }

        if (rc.crudAction == "Create" || rc.crudAction == "Update") {

            if (validateEmpFormReqFields(trim(rc.vcLastName), trim(rc.vcFirstName)) == false) {

                prc.message = "First Name and Last Name fields are required."
                relocate('employee/index/message/' & prc.message);

            } else {
                prc.anEmployee.setVcLastName(trim(rc.vcLastName));
                prc.anEmployee.setVcFirstName(trim(rc.vcFirstName));
                prc.anEmployee.setVcTitle(trim(rc.vcTitle));
                prc.anEmployee.setVcTitleOfCourtesy(trim(rc.vcTitleOfCourtesy));
                prc.anEmployee.setDtBirthDate(trim(rc.dtBirthDate));
                prc.anEmployee.setDtHireDate(trim(rc.dtHireDate));
                prc.anEmployee.setVcAddress(trim(rc.vcAddress));
                prc.anEmployee.setVcCity(trim(rc.vcCity));
                prc.anEmployee.setVcRegion(trim(rc.vcRegion));
                if (IsNumeric(rc.vcPostalCode)){
                    prc.anEmployee.setVcPostalCode(rc.vcPostalCode);
                }
                prc.anEmployee.setVcCountry(trim(rc.vcCountry));
                prc.anEmployee.setVcHomePhone(trim(rc.vcHomePhone));
                prc.anEmployee.setVcExtension(trim(rc.vcExtension));
                prc.anEmployee.setVcNotes(trim(rc.vcNotes));
                prc.anEmployee.setIntCompanyKey(rc.intCompanyKey);
            }
        }

        // Function chain will run insert query
        EmployeeService.save(prc.anEmployee, rc.crudAction);

        prc.message = "Your action was successful."
        relocate('employee/index/message/' & prc.message);

    } 
    
    // Replaces all employees' first names that appear on cnn.com with "MOD" 
    function getCnnContent(event, rc, prc) {

        // Exit handlers
        prc.xeh.validateLogin = "main/validateLogin";

        // Function chain will run select query
        prc.allEmployeesFirstNames = EmployeeService.getAllEmployeesFirstNames();

        // Gets cnn.com and saves the response in a var
        http url = "https://www.cnn.com/" method = "get" result = "httpResponse" {}
        prc.modifiedContent = httpResponse.fileContent;

        // Replaces names in query results
        for (var name in prc.allEmployeesFirstNames) {
            prc.modifiedContent = replace(prc.modifiedContent, prc.allEmployeesFirstNames.vcFirstName, "MOD", "all");
        }

        emailCnnContent(prc.modifiedContent);
        
        event.noLayout()
        event.setView( "employee/cnn" );
    }

    function emailCnnContent(modifiedContent) {

        session.email = getSystemSetting( "EMAIL", "" );

        mail to="#session.email#" from="#session.email#" subject="CNN" type="html" {
            writeOutput(modifiedContent);
        }

        return session.email;
    }
  
}