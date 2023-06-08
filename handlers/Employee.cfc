component extends="coldbox.system.EventHandler" {

    property name="EmployeeService" inject="model:EmployeeService";
    property name="EmployeeGateway" inject="model:EmployeeGateway";
    property name="CompanyService" inject="model:CompanyService";


    function index() {

        prc.welcomeMessage = "Welcome, #session.vcUserName#!";
        prc.allEmployees = EmployeeService.getAllEmployees();

        // Populates the company dropdown in the form
        prc.allCompanies = CompanyService.getAllCompanies();

        if (structKeyExists(rc, "isCompanyFormSubmission") && rc.isCompanyFormSubmission == "true") {
            prc.employeesByCompanyKey = CompanyService.getEmployeesByCompanyKey(rc.intCompanyKey);
        }

        if (structKeyExists(prc, "errorMessage")) {
            prc.errorMessages = prc.errorMessage;
        }

        // Exit Handlers
        prc.xeh.readEmployee = "employee/readEmployee";
        prc.xeh.createEmployee = "employee/createEmployee";
        prc.xeh.updateEmployee = "employee/updateEmployee";
        prc.xeh.deleteEmployee = "employee/deleteEmployee";
        prc.xeh.createCompany = "company/createCompany";
        prc.xeh.createUser = "user/createUser";
        prc.xeh.employeeIndex = "employee/index";
        
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
        prc.btnClass = "btn btn-primary mt-2";

        prc.crudAction = "Read Only";
        prc.formTitle = "View Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        // Extra check. Should always have a value with this crud action
        if (structKeyExists(rc, "intEmployeeID")) {
            prc.oneEmployee = EmployeeService.getOneEmployee(rc.intEmployeeID);
        }

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
        prc.btnClass = "btn btn-primary mt-2";

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
        prc.btnClass = "btn btn-primary mt-2";

        prc.crudAction = "Update";
        prc.formTitle = "Edit Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        // Extra check. Should always have a value with this crud action
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
        prc.btnClass = "btn btn-danger mt-2";

        prc.crudAction = "Delete";
        prc.formTitle = "Delete Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        // Extra check. Should always have a value with this crud action
        if (structKeyExists(rc, "intEmployeeID")) {
            prc.oneEmployee = EmployeeService.getOneEmployee(rc.intEmployeeID);
        }

        event.setView( "employee/employeeCrud" );
    }

/*******************************************************************/
    // Determines which CRUD action to take
    function save(event, rc, prc) {

        prc.anEmployee = populateModel( "Employee" );

        if (rc.crudAction == "Create" || rc.crudAction == "Update") {

            prc.errorMessage = EmployeeService.validate(prc.anEmployee);

            if (len(prc.errorMessage) != 0) {
                relocate('employee/index');
            } 
        } 
        // Function chain will run insert query
        EmployeeService.save(prc.anEmployee, rc.crudAction);

        relocate('employee/index');
    } 

    
    // Replaces all employees' first names that appear on cnn.com with "MOD" 
    function getCnnContent(event, rc, prc) {

        // Function chain will run select query
        prc.allEmployeesFirstNames = EmployeeService.getAllEmployeesFirstNames();
        // Gets cnn.com and saves the response in an http var
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

        prc.email = getSystemSetting( "EMAIL", "" );
        mail to="#prc.email#" from="#prc.email#" subject="CNN" type="html" {
            writeOutput(modifiedContent);
        }

        return session.email;
    }
  
}