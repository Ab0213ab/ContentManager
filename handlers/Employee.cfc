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

        prc.successMessages = "";
        prc.successClass = "";
        prc.errorMessages = [];
        prc.errorClass = "";

        // Populates the company dropdown in the form
        prc.allCompanies = CompanyService.getAllCompanies();

        // To avoid conditionals in form fields
        if (structKeyExists(rc, "isCompanyFormSubmission") && rc.isCompanyFormSubmission == "true") {
            prc.employeesByCompanyKey = CompanyService.getEmployeesByCompanyKey(rc.intCompanyKey);
        } else {
            prc.employeesByCompanyKey = CompanyService.getEmployeesByCompanyKey(-1);
        }

        // For post-action
        if (structKeyExists(session, "errorMessages") && len(session.errorMessages) != 0) { 
            prc.errorClass = "alert alert-danger text-center";
            prc.errorMessages = session.errorMessages;
            session.errorMessages = "";
        }
        if (structKeyExists(session, "successMessages") && session.successMessages != "") {
            prc.successClass = "alert alert-success text-center";
            prc.successMessages = session.successMessages;
            session.successMessages = "";
        }
        
        event.setView( "employee/index" );
    }


    // Determines which CRUD action to take
    function save(event, rc, prc) {

        // Since form values are always sent as strs
        if (structKeyExists(rc, 'intEmployeeID')) {
            rc.intEmployeeID = val(rc.intEmployeeID);
        }

        prc.anEmployee = populateModel( "Employee" );

        if (rc.crudAction == "Create" || rc.crudAction == "Update") {

            // Validates object attributes (form fields)
            prc.errorMessages = EmployeeService.validate(prc.anEmployee);

            if (len(prc.errorMessages) != 0) {
                session.errorMessages = prc.errorMessages;
                relocate('employee/index');
            } 
        } 
        // Function chain will run insert query
        EmployeeService.save(prc.anEmployee, rc.crudAction);
        session.successMessages = "Your action was successful."
        
        relocate('employee/index');
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
        prc.btnClass = "btn btn-primary mt-2";

        prc.crudAction = "Create";
        prc.formTitle = "Add Employee";

        // Sets form values to empty strings as no intEmployeeID == -1
        prc.oneEmployee = EmployeeService.getOneEmployee(-1);

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

        prc.oneEmployee = EmployeeService.getOneEmployee(rc.intEmployeeID);

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

        prc.oneEmployee = EmployeeService.getOneEmployee(rc.intEmployeeID);


        event.setView( "employee/employeeCrud" );
    }

/*******************************************************************/
 

    
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