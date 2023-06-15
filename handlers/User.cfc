component extends="coldbox.system.EventHandler" {

    property name="UserService" inject="model:UserService";
    property name="UserGateway" inject="model:UserGateway";

    function index() {

        // Exit Handlers
        prc.xeh.employeeIndex = "employee/index";
        prc.xeh.updateUser = "user/updateUser";
        prc.xeh.deleteUser = "user/deleteUser";
        prc.xeh.addUser = "user/createUser";

        prc.successMessage = "";
        prc.successClass = "";
        prc.errorMessages = [];
        prc.errorClass = "";

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

        // Populates the user list
        prc.allUsers = UserService.getAllUsers();
        prc.formTitle = "Users";

        event.setView( "user/viewUsers" );
    }

    function createUser(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "user/save";

        // For form fields
        prc.fieldsEnabled = "";
        // For action button
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-person-plus";
        prc.btnClass = "btn btn-primary mt-2";

        prc.crudAction = "Create";
        prc.formTitle = "Add User";

        prc.oneUser = UserService.createEmptyUser();

        // For radio buttons
        prc.isActiveYes = '';
        prc.isActiveNo = '';
        prc.isAdminYes = '';
        prc.isAdminNo = '';

        event.setView( "user/userCrud" );
    }

    function updateUser(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "user/save";

        // For form fields
        prc.fieldsEnabled = "";
        // For action button
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-pen";
        prc.btnClass = "btn btn-primary mt-2";

        prc.crudAction = "Update";
        prc.formTitle = "Edit User";

        prc.oneUser = UserService.getOneUser(rc.intUserID);

        // For radio buttons
        if (prc.oneUser.bitIsActive == 1) {
            prc.isActiveYes = 'checked';
            prc.isActiveNo = '';
        } else if (prc.oneUser.bitIsActive == 0) {
            prc.isActiveYes = '';
            prc.isActiveNo = 'checked';
        }

        if (prc.oneUser.bitIsAdmin == 1) {
            prc.isAdminYes = 'checked';
            prc.isAdminNo = '';
        } else if (prc.oneUser.bitIsAdmin == 0) {
            prc.isAdminYes = '';
            prc.isAdminNo = 'checked';
        }

        event.setView( "user/userCrud" );

    }

    function deleteUser(event, rc, prc) {

        // Exit Handlers
        prc.xeh.save = "user/save";

        // For form fields
        prc.fieldsEnabled = "disabled";
        // For action button
        prc.btnEnabled = "";
        prc.btnIcon = "bi bi-person-x-fill";
        prc.btnClass = "btn btn-danger mt-2";

        prc.crudAction = "Delete";
        prc.formTitle = "Delete User";

        prc.oneUser = UserService.getOneUser(rc.intUserID);

        // For radio buttons
        if (prc.oneUser.bitIsActive == 1) {
            prc.isActiveYes = 'checked';
            prc.isActiveNo = '';
        } else if (prc.oneUser.bitIsActive == 0) {
            prc.isActiveYes = '';
            prc.isActiveNo = 'checked';
        }

        if (prc.oneUser.bitIsAdmin == 1) {
            prc.isAdminYes = 'checked';
            prc.isAdminNo = '';
        } else if (prc.oneUser.bitIsAdmin == 0) {
            prc.isAdminYes = '';
            prc.isAdminNo = 'checked';
        }

        event.setView( "user/userCrud" );
    }

    // Determines which CRUD action to take
    function save(event, rc, prc) {

        prc.aUser = UserService.getEmptyDomain();
        populateModel(prc.aUser);

        prc.errorMessages = UserService.validate(prc.aUser, rc.crudAction);

        if (len(prc.errorMessages) != 0) {
            session.errorMessages = prc.errorMessages;
            relocate('user/index');
        }

        // Function chain will run insert query
        UserService.save(prc.aUser, rc.crudAction);

        session.successMessage = UserService.getSuccessMessage(rc.crudAction);

        relocate('user/index');
    }
  
}