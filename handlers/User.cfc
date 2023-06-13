component extends="coldbox.system.EventHandler" {

    property name="UserService" inject="model:UserService";
    property name="UserGateway" inject="model:UserGateway";

    function index() {

        // Exit Handlers
        prc.xeh.employeeIndex = "employee/index";
        prc.xeh.updateUser = "user/updateUser";

        // Populates the user list
        prc.allUsers = UserService.getAllUsers();
        prc.formTitle = "All Users";

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

        // Sets form values to empty strings as no intUserID == -1
        prc.oneUser = UserService.getOneUser(-1);

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

        event.setView( "user/userCrud" );

    }

    // Determines which CRUD action to take
    function save(event, rc, prc) {

        // Since form values are always sent as strs
        if (structKeyExists(rc, 'intUserID')) {
            rc.intUserID = val(rc.intUserID);
        }        

        prc.aUser = populateModel( "User" );

        if (rc.crudAction == "Create" || rc.crudAction == "Update") {

            // Validates object attributes (for fields)
            prc.errorMessages = UserService.validate(prc.aUser);

             if (len(prc.errorMessages) != 0) {
                 session.errorMessages = prc.errorMessages;
                 relocate('employee/index');
             }

        } 
        // Function chain will run insert query
        UserService.save(prc.aUser, rc.crudAction);
        session.successMessages = "Your action was successful."

        relocate('employee/index');
    }
  
}