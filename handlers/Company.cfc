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

        prc.aCompany = populateModel( "Company" );

        if (rc.crudAction == "Create" || rc.crudAction == "Update") {

            prc.errorMessage = CompanyService.validate(prc.aCompany);

            if (len(prc.errorMessage) != 0) {
                flash.put("errorMessage", prc.errorMessage);
                relocate('employee/index');
            } 
        } 
        // Function chain will run insert query
        CompanyService.save(prc.aCompany, rc.crudAction);
        prc.successMessage = "Your action was successful."
        flash.put("successMessage", prc.successMessage);

        relocate('employee/index');
    }
  
}