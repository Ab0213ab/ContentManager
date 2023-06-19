component extends="coldbox.system.EventHandler" {

    property name="EmployeeService" inject="model:EmployeeService";
    property name="EmployeeGateway" inject="model:EmployeeGateway";
    property name="CompanyService" inject="model:CompanyService";


    function index() {

        // Exit Handlers
        prc.xeh.readEmployee = "employee/readEmployee";
        prc.xeh.createEmployee = "employee/createEmployee";
        prc.xeh.updateEmployee = "employee/updateEmployee";
        prc.xeh.deleteEmployee = "employee/deleteEmployee";
        prc.xeh.createCompany = "company/createCompany";
        prc.xeh.createUser = "user/createUser";
        prc.xeh.employeeIndex = "employee/index";

        prc.welcomeMessage = "Welcome, #session.vcUserName#!";
        prc.allEmployees = EmployeeService.getAllEmployees();

        // Populates the company dropdown in the form
        prc.allCompanies = CompanyService.getAllCompanies();

        // To avoid conditionals in form fields
        if (structKeyExists(rc, "isCompanyFormSubmission") && rc.isCompanyFormSubmission == "true") {
            prc.employeesByCompanyKey = CompanyService.getEmployeesByCompanyKey(rc.intCompanyKey);
        } else {
            prc.employeesByCompanyKey = CompanyService.getEmployeesByCompanyKey(-1);
        }
        
        event.setView( "employee/index" );
    }


    function readEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/save";

        prc.fieldsEnabled = "disabled";
        prc.btnEnabled = "disabled";
        prc.btnIcon = "bi bi-book";
        prc.btnClass = "btn btn-primary mt-2";
        prc.crudAction = "Read Only";
        prc.formTitle = "View Employee";
        prc.onClick = "";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        prc.oneEmployee = EmployeeService.getOneEmployee(rc.intEmployeeID);

        event.setView( "employee/employeeCrud" );
    }


    function createEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/save";

        prc.fieldsEnabled = "";
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-person-plus";
        prc.btnClass = "btn btn-primary mt-2";
        prc.crudAction = "Create";
        prc.formTitle = "Add Employee";
        prc.onClick = "return validateEmployeeForm();";

        prc.oneEmployee = EmployeeService.getEmptyDomain();

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        event.setView( "employee/employeeCrud" );
    }


    function updateEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/save";

        prc.fieldsEnabled = "";
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-pen";
        prc.btnClass = "btn btn-primary mt-2";
        prc.crudAction = "Update";
        prc.formTitle = "Edit Employee";
        prc.onClick = "return validateEmployeeForm();";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        prc.oneEmployee = EmployeeService.getOneEmployee(rc.intEmployeeID);

        event.setView( "employee/employeeCrud" );

    }


    function deleteEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/delete";

        prc.fieldsEnabled = "disabled";
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-person-x-fill";
        prc.btnClass = "btn btn-danger mt-2";
        prc.crudAction = "Delete";
        prc.formTitle = "Delete Employee";
        prc.onClick = "";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        prc.oneEmployee = EmployeeService.getOneEmployee(rc.intEmployeeID);


        event.setView( "employee/employeeCrud" );
    }

    function viewEmployees() {

        // Exit Handlers
        prc.xeh.createEmployee = "employee/createEmployee";
        prc.xeh.updateEmployee = "employee/updateEmployee";
        prc.xeh.deleteEmployee = "employee/deleteEmployee";
        prc.xeh.readEmployee = "employee/readEmployee";

        prc.successMessage = "";
        prc.successClass = "";
        prc.errorMessages = [];
        prc.errorClass = "";

        prc.allEmployees = EmployeeService.getAllEmployees();
        prc.formTitle = "Employees";

        // For post-action
        if (structKeyExists(session, "errorMessages") && len(session.errorMessages) != 0) { 
            prc.errorClass = "alert alert-danger text-center";
            prc.errorMessages = session.errorMessages;
            session.errorMessages = "";
        }
        if (structKeyExists(session, "successMessage") && session.successMessage != "") {
            prc.successClass = "alert alert-success text-center";
            prc.successMessage = session.successMessage;
            session.successMessage = "";
        }

        event.setView( "employee/viewEmployees" );
    }

    
    function delete(event, rc, prc) {

        prc.anEmployee = EmployeeService.getEmptyDomain();
        populateModel(prc.anEmployee);

        // Function chain will run query
        EmployeeService.delete(prc.anEmployee);
        
        relocate('employee/viewEmployees');
    }


    function save(event, rc, prc) {

        prc.anEmployee = EmployeeService.getEmptyDomain();
        populateModel(prc.anEmployee);

        prc.errorMessages = EmployeeService.validate(prc.anEmployee);
        if (len(prc.errorMessages) != 0) {
            session.errorMessages = prc.errorMessages;
            relocate('employee/viewEmployees');
        }

        // Function chain will run query
        EmployeeService.save(prc.anEmployee);
        session.successMessage = EmployeeService.getSuccessMessage(prc.anEmployee);

        relocate('employee/viewEmployees');
    }




    /* From version 1.0, removed in version 2.0
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
    }*/
  
}