component singleton accessors="true"{

	// Properties
    property name="UserGateway" inject="model:UserGateway";
	
	/**
	 * Constructor
	 */
	UserService function init() {

		return this;
	}

	// For selecting all users
	function getAllUsers(){

        var getAllUsers = UserGateway.getAllUsers();
        return getAllUsers;
    }

	// For selecting all users
	function getOneUser(intUserID){

        var getOneUser = UserGateway.getOneUser(intUserID);
        return getOneUser;
    }

	// Function chain will run insert query
	function save(aUser, crudAction) {

		if (crudAction == "Create") {
			UserGateway.create(aUser);
		} else if (crudAction == "Update") {
			UserGateway.update(aUser);
		} else if (crudAction == "Delete") {
			UserGateway.delete(aUser);
		}
		return;
	}

	function validate(aUser) {

		prc.errorMessage = [];

		if (aUser.getVcUserName() == "") {
			arrayAppend(prc.errorMessage, "User Name field is required.")
		}
		if (aUser.getVcPassword() == "") {
			arrayAppend(prc.errorMessage, "Password field is required.")
		}
		if (aUser.getBitIsActive() == "") {
			arrayAppend(prc.errorMessage, "Is Active field is required.")
		}
		if (aUser.getBitIsAdmin() == "") {
			arrayAppend(prc.errorMessage, "Is Admin field is required.")
		}
		
		return prc.errorMessage;
	}

}