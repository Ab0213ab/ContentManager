component extends="coldbox.system.EventHandler" {

    property name="EmployeeService" inject="model:EmployeeService";
    property name="EmployeeGateway" inject="model:EmployeeGateway";
    property name="CompanyService" inject="model:CompanyService";


    function index() {

        prc.welcomeMessage = "Welcome, #session.userName#!";
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

        prc.formTitle = "View Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        prc.intEmployeeID = event.getValue("intEmployeeID", "");
        prc.oneEmployee = EmployeeService.getOneEmployee(prc.intEmployeeID);

        event.setView( "employee/employeeCrud" );
    }


    function createEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/save";

        // For form fields
        prc.fieldsEnabled = "";
        // For action button
        prc.btnEnabled = "";
        prc.crudAction = "create";

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
        prc.crudAction = "update";

        prc.formTitle = "Edit Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        prc.intEmployeeID = event.getValue("intEmployeeID", "");
        prc.oneEmployee = EmployeeService.getOneEmployee(prc.intEmployeeID);

        event.setView( "employee/employeeCrud" );

    }

    function deleteEmployee(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "employee/save";

        // For form fields
        prc.fieldsEnabled = "disabled";
        // For action button
        prc.btnEnabled = "";
        prc.crudAction = "delete";

        prc.formTitle = "Delete Employee";

        // Populates the company dropdown in the add form
        prc.allCompanies = CompanyService.getAllCompanies();

        prc.intEmployeeID = event.getValue("intEmployeeID", "");
        prc.oneEmployee = EmployeeService.getOneEmployee(prc.intEmployeeID);

        event.setView( "employee/employeeCrud" );
    }

    // Determines which CRUD action to take
    function save(event, rc, prc) {

        prc.anEmployee = new models.domains.Employee();

        // Sets properties with form values
        if (IsNumeric(rc.intEmployeeID)){
            prc.anEmployee.setIntEmployeeID(rc.intEmployeeID);
        }

        if (rc.crudAction == "create" || rc.crudAction == "update") {

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

        // Function chain will run insert query
        EmployeeService.save(prc.anEmployee, rc.crudAction);

        prc.message = "Your action was successful."
        relocate('employee/index/message/' & prc.message);

    }    
  
}