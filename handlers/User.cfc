component extends="coldbox.system.EventHandler" {

    property name="UserService" inject="model:UserService";
    property name="UserGateway" inject="model:UserGateway";

    function index() {

        // Exit Handlers
        prc.xeh.employeeIndex = "employee/index";

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

        event.setView( "user/userCrud" );
    }

    // Determines which CRUD action to take
    function save(event, rc, prc) {

        prc.aUser = populateModel( "User" );

        if (rc.crudAction == "Create" || rc.crudAction == "Update") {

            // Validates object attributes (for fields)
            prc.errorMessage = UserService.validate(prc.aUser);

            if (len(prc.errorMessage) != 0) {
                flash.put("errorMessage", prc.errorMessage);
                relocate('employee/index');
            } 
        } 
        // Function chain will run insert query
        UserService.save(prc.aUser, rc.crudAction);
        prc.successMessage = "Your action was successful."
        flash.put("successMessage", prc.successMessage);

        relocate('employee/index');
    }
  
}