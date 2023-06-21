component extends="coldbox.system.EventHandler" {

    property name="CompanyService" inject="model:CompanyService";
    property name="CompanyGateway" inject="model:CompanyGateway";


    function createCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/save";

        // // For form fields
        // prc.fieldsEnabled = "";
        // // For action button
        // prc.btnEnabled = "";
        // prc.btnIcon = "bi bi-person-plus";
        // prc.btnClass = "btn btn-primary mt-2";
        // prc.crudAction = "Create";
        // prc.formTitle = "Add Company";

        // prc.oneCompany = CompanyService.getEmptyDomain();

        // // For radio buttons
        // prc.isActiveYes = '';
        // prc.isActiveNo = '';

        prc.formData = CompanyService.buildCreateForm(prc, rc);

        event.setView( "company/companyCrud" );
    }

    function updateCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/save";

        // prc.fieldsEnabled = "";
        // prc.btnEnabled = "";
        // prc.btnIcon = "bi bi-pen";
        // prc.btnClass = "btn btn-primary mt-2";
        // prc.crudAction = "Update";
        // prc.formTitle = "Edit Company";

        //prc.oneCompany = CompanyService.getOneCompany(rc.intCompanyKey);

        // For radio buttons
        // prc.isActiveYes = (prc.oneCompany.bitIsActive == 1) ? 'checked' : '';
        // prc.isActiveNo = (prc.oneCompany.bitIsActive == 1) ? '' : 'checked';

        prc.formData = CompanyService.buildUpdateForm(prc, rc);

        event.setView( "company/companyCrud" );
    }

    function deleteCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/delete";

        // prc.fieldsEnabled = "disabled";
        // prc.btnEnabled = "";
        // prc.btnIcon = "bi bi-person-x-fill";
        // prc.btnClass = "btn btn-danger mt-2";
        // prc.crudAction = "Delete";
        // prc.formTitle = "Delete Company";

        // prc.oneCompany = CompanyService.getOneCompany(rc.intCompanyKey);

        // // For radio buttons
        // prc.isActiveYes = (prc.oneCompany.bitIsActive == 1) ? 'checked' : '';
        // prc.isActiveNo = (prc.oneCompany.bitIsActive == 1) ? '' : 'checked';

        prc.formData = CompanyService.buildDeleteForm(prc, rc);

        event.setView( "company/companyCrud" );
    }

    function viewCompanies() {

        // Exit Handlers
        prc.xeh.readEmployee = "employee/readEmployee";
        prc.xeh.updateCompany = "company/updateCompany";
        prc.xeh.deleteCompany = "company/deleteCompany";
        prc.xeh.createCompany = "company/createCompany";

        prc.successMessage = "";
        prc.successClass = "";
        prc.errorMessages = [];
        prc.errorClass = "";

        prc.allCompanies = CompanyService.getAllCompanies();
        prc.formTitle = "Companies";

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

        event.setView("company/viewCompanies");
    }


    function delete(event, rc, prc) {

        prc.aCompany = CompanyService.getEmptyDomain();
        populateModel(prc.aCompany);

        CompanyService.delete(prc.aCompany);
        
        relocate('company/viewCompanies');
    }


    function save(event, rc, prc) {

        prc.aCompany = CompanyService.getEmptyDomain();
        populateModel(prc.aCompany);

        prc.errorMessages = CompanyService.validate(prc.aCompany);
        if (len(prc.errorMessages) != 0) {
            session.errorMessages = prc.errorMessages;
            relocate('company/ViewCompanies');
        }

        CompanyService.save(prc.aCompany);
        session.successMessage = CompanyService.getSuccessMessage(prc.aCompany);

        relocate('company/viewCompanies');
    }
}


/*





component extends="coldbox.system.EventHandler" {

    property name="CompanyService" inject="model:CompanyService";
    property name="CompanyGateway" inject="model:CompanyGateway";


    function createCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/save";

        prc.formData = CompanyService.buildCreateForm(prc, rc);
        event.setView( "company/companyCrud" );
    }

    function updateCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/save";

        prc.formData = CompanyService.buildUpdateForm(prc, rc);
        event.setView( "company/companyCrud" );
    }

    function deleteCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/delete";

        prc.formData = CompanyService.buildDeleteForm(prc, rc);
        event.setView( "company/companyCrud" );
    }

    function viewCompanies() {

        // Exit Handlers
        prc.xeh.readEmployee = "employee/readEmployee";
        prc.xeh.updateCompany = "company/updateCompany";
        prc.xeh.deleteCompany = "company/deleteCompany";
        prc.xeh.createCompany = "company/createCompany";

        prc.viewData = CompanyService.buildViewCompanies(prc, rc);
        event.setView("company/viewCompanies");
    }


    function delete(event, rc, prc) {

        prc.aCompany = CompanyService.getEmptyDomain();
        populateModel(prc.aCompany);

        CompanyService.delete(prc.aCompany);
        relocate('company/viewCompanies');
    }


    function save(event, rc, prc) {

        prc.aCompany = CompanyService.getEmptyDomain();
        populateModel(prc.aCompany);

        prc.errorMessages = CompanyService.validate(prc.aCompany);
        if (len(prc.errorMessages) != 0) {
            session.errorMessages = prc.errorMessages;
            relocate('company/ViewCompanies');
        }

        CompanyService.save(prc.aCompany);
        session.successMessage = CompanyService.getSuccessMessage(prc.aCompany);

        relocate('company/viewCompanies');
    }
}







*/