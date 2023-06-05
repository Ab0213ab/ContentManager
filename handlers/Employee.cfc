component extends="coldbox.system.EventHandler" {

    property name="EmployeeService" inject="model:EmployeeService";
    property name="EmployeeGateway" inject="model:EmployeeGateway";
    property name="CompanyService" inject="model:CompanyService";

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

        prc.intEmployeeID = event.getValue("intEmployeeID", "");
        prc.oneEmployee = EmployeeService.getOneEmployee(prc.intEmployeeID);

        event.setView( "employee/employeeCrud" );
    }

    // Ensures required fields have data
    function validateEmpFormReqFields(
        crudAction, 
        vcLastName, 
        vcFirstName, 
        vcCity, 
        vcRegion, 
        vcHomePhone) {

        var isValid = true;

        // Form validation unecessary if Delete
        if (crudAction == " Delete") {
            isValid = true;

            // If no matches
        } else {
            if (REFind("^(?!$)[A-Za-z\s]+$", vcLastName) == 0) {
                isValid = false;

            }
            if (REFind("^(?!$)[A-Za-z\s]*$", vcFirstName) == 0) {
                isValid = false;

            }
            if (REFind("^[A-Za-z\s]*$", vcRegion) == 0) {
                isValid = false;

            }
            if (REFind("^[A-Za-z\s]*$", vcCity) == 0) {
                isValid = false;

            }
            if (REFind("^[0-9\s]*$", vcHomePhone) == 0) {
                isValid = false;

            }
        }
        return isValid;
    }

    // Determines which CRUD action to take
    // ORIGINAL FUNCTION
    function save(event, rc, prc) {

        prc.anEmployee = new models.domains.Employee();

        // Only sets var if it exists (update or delete)
        if (IsNumeric(rc.intEmployeeID)) {
            prc.anEmployee.setIntEmployeeID(rc.intEmployeeID);
        }

        if (rc.crudAction == "Create" || rc.crudAction == "Update") {

            if (validateEmpFormReqFields(rc.crudAction, 
            trim(rc.vcLastName), 
            trim(rc.vcFirstName), 
            trim(rc.vcCity), 
            trim(rc.vcRegion), 
            trim(rc.vcHomePhone)) == false) {

                prc.message = "Your action was unsuccessful. Invalid data was entered into 
                one or more required fields."
                relocate('employee/index/message/' & prc.message);

            } else {
                
                // Sets properties with form values
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