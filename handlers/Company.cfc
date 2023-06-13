component extends="coldbox.system.EventHandler" {

    property name="CompanyService" inject="model:CompanyService";
    property name="CompanyGateway" inject="model:CompanyGateway";

    function index() {

    }

    function createCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/save";

        // For form fields
        prc.fieldsEnabled = "";
        // For action button
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-person-plus";
        prc.btnClass = "btn btn-primary mt-2";

        prc.crudAction = "Create";
        prc.formTitle = "Add Company";

        // Sets form values to empty strings as no intCompanyKey == -1
        prc.oneCompany = CompanyService.getOneCompany(-1);

        event.setView( "company/companyCrud" );
    }

    function viewCompanies() {

        // Exit Handlers
        prc.xeh.viewCompanies = "company/viewCompanies";
        prc.xeh.readEmployee = "employee/readEmployee";

        // To avoid conditionals in form fields
        if (structKeyExists(rc, "isCompanyTableSubmission") && rc.isCompanyTableSubmission == "true") {
            prc.employeesByCompanyKey = CompanyService.getEmployeesByCompanyKey(val(rc.intCompanyKey));
            prc.displayModal = true;
        } else {
            prc.employeesByCompanyKey = CompanyService.getEmployeesByCompanyKey(-1);
        }

        prc.allCompanies = CompanyService.getAllCompanies();
        prc.formTitle = "View Companies";

        event.setView("company/viewCompanies");
    }

    // Determines which CRUD action to take
    function save(event, rc, prc) {

        // Since form values are always sent as strs
        if (structKeyExists(rc, 'intCompanyKey')) {
            rc.intCompanyKey = val(rc.intCompanyKey);
        }

        prc.aCompany = populateModel( "Company" );

        if (rc.crudAction == "Create" || rc.crudAction == "Update") {

            prc.errorMessages = CompanyService.validate(prc.aCompany);

            if (len(prc.errorMessages) != 0) {
                session.errorMessages = prc.errorMessages;
                relocate('employee/index');
            }
        } 
        // Function chain will run insert query
        CompanyService.save(prc.aCompany, rc.crudAction);
        session.successMessages = "Your action was successful."

        relocate('employee/index');
    }
  
}