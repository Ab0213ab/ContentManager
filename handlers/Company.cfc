component extends="coldbox.system.EventHandler" {

    property name="CompanyService" inject="model:CompanyService";
    property name="CompanyGateway" inject="model:CompanyGateway";


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
        prc.onClick = "return validateCompanyForm();";

        prc.oneCompany = CompanyService.getEmptyDomain();

        // For radio buttons
        prc.isActiveYes = '';
        prc.isActiveNo = '';

        event.setView( "company/companyCrud" );
    }

    function updateCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/save";

        prc.fieldsEnabled = "";
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-pen";
        prc.btnClass = "btn btn-primary mt-2";
        prc.crudAction = "Update";
        prc.formTitle = "Edit Company";
        prc.onClick = "return validateCompanyForm();";

        prc.oneCompany = CompanyService.getOneCompany(rc.intCompanyKey);

        // For radio buttons
        if (prc.oneCompany.bitIsActive == 1) {
            prc.isActiveYes = 'checked';
            prc.isActiveNo = '';
        } else {
            prc.isActiveYes = '';
            prc.isActiveNo = 'checked';
        }

        event.setView( "company/companyCrud" );
    }

    function deleteCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/delete";

        prc.fieldsEnabled = "disabled";
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-person-x-fill";
        prc.btnClass = "btn btn-danger mt-2";
        prc.crudAction = "Delete";
        prc.formTitle = "Delete Company";
        prc.onClick = "";

        prc.oneCompany = CompanyService.getOneCompany(rc.intCompanyKey);

        // For radio buttons
        if (prc.oneCompany.bitIsActive == 1) {
            prc.isActiveYes = 'checked';
            prc.isActiveNo = '';
        } else {
            prc.isActiveYes = '';
            prc.isActiveNo = 'checked';
        }

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

        // Function chain will run query
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

        // Function chain will run query
        CompanyService.save(prc.aCompany);
        session.successMessage = CompanyService.getSuccessMessage(prc.aCompany);

        relocate('company/viewCompanies');
    }
}