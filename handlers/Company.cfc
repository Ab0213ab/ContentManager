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

        prc.oneCompany = CompanyService.createEmptyCompany();

        // For radio buttons
        prc.isActiveYes = '';
        prc.isActiveNo = '';

        event.setView( "company/companyCrud" );
    }

    function updateCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/save";

        // For form fields
        prc.fieldsEnabled = "";
        // For action button
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-pen";
        prc.btnClass = "btn btn-primary mt-2";

        prc.crudAction = "Update";
        prc.formTitle = "Edit Company";

        prc.oneCompany = CompanyService.getOneCompany(rc.intCompanyKey);

        // For radio buttons
        if (prc.oneCompany.bitIsActive == 1) {
            prc.isActiveYes = 'checked';
            prc.isActiveNo = '';
        } else if (prc.oneCompany.bitIsActive == 0) {
            prc.isActiveYes = '';
            prc.isActiveNo = 'checked';
        }

        event.setView( "company/companyCrud" );

    }

    function deleteCompany(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "company/save";

        // For form fields
        prc.fieldsEnabled = "disabled";
        // For action button
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-person-x-fill";
        prc.btnClass = "btn btn-danger mt-2";

        prc.crudAction = "Delete";
        prc.formTitle = "Delete Company";

        prc.oneCompany = CompanyService.getOneCompany(rc.intCompanyKey);

        // For radio buttons
        if (prc.oneCompany.bitIsActive == 1) {
            prc.isActiveYes = 'checked';
            prc.isActiveNo = '';
        } else if (prc.oneCompany.bitIsActive == 0) {
            prc.isActiveYes = '';
            prc.isActiveNo = 'checked';
        }

        event.setView( "company/companyCrud" );
    }

    function viewCompanies() {

        // Exit Handlers
        prc.xeh.viewCompanies = "company/viewCompanies";
        prc.xeh.readEmployee = "employee/readEmployee";
        prc.xeh.updateCompany = "company/updateCompany";
        prc.xeh.deleteCompany = "company/deleteCompany";
        prc.xeh.createCompany = "company/createCompany";

        // To avoid conditionals in form fields
        if (structKeyExists(rc, "isCompanyTableSubmission") && rc.isCompanyTableSubmission == "true") {
            prc.employeesByCompanyKey = CompanyService.getEmployeesByCompanyKey(val(rc.intCompanyKey));
            prc.displayModal = true;
        } else {
            prc.employeesByCompanyKey = CompanyService.getEmployeesByCompanyKey(-1);
        }

        prc.allCompanies = CompanyService.getAllCompanies();
        prc.formTitle = "Companies";

        event.setView("company/viewCompanies");
    }

    // Determines which CRUD action to take
    function save(event, rc, prc) {

        // Since form values are always sent as strs
        if (structKeyExists(rc, 'intCompanyKey')) {
            rc.intCompanyKey = val(rc.intCompanyKey);
        }

        prc.aCompany = CompanyService.getEmptyDomain();

        //prc.aCompany = populateModel( "Company" );
        populateModel(prc.aCompany);

        prc.errorMessages = CompanyService.validate(prc.aCompany, rc.crudAction);

        if (len(prc.errorMessages) != 0) {
            session.errorMessages = prc.errorMessages;
            relocate('employee/index');
        }

        // Function chain will run insert query
        CompanyService.save(prc.aCompany, rc.crudAction);
        session.successMessages = "Your action was successful."

        relocate('employee/index');
    }
  
}  
/*

Process user create()
// Gets empty model, stores in var
rc.user = userService.getEmptyDomain();

// Validates rc fields/attributes makes sure they exist in the rc, does other validation
var hasError = userService.validateCreate(rc, session.messenger);

// if an error, relocates
if ( hasError )
relocate(event="userManagement/viewUserCreate");

// Populates empty domain with empty fields
populateModel(rc.user);

// Then saves it
rc.user = userService.save(rc.user);


save()
// if there's a usedID, calls update()
// if not, calls create

create()
// Checks if that usedID exists already and if so, throws error
if not, calls gateway.create()

returns load(userID)

load()
// gets empty domain
populates it with populate()
calls gateway.load, which is a select statement for what was just inserted
returns the object


processUserUpdate()
-checks if form user id is numeric and exists
- Uses load to store the query select statement in an object/var
- Validates object
- populates model

*/