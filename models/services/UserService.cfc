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

	// Function chain will run query
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

	function validate(aUser, crudAction) {

		prc.errorMessages = [];

		if (crudAction == "Delete") {
			return prc.errorMessages;
		}

		if (aUser.getVcUserName() == "") {
			arrayAppend(prc.errorMessages, "User Name field is required.")
		}
		if (aUser.getVcPassword() == "") {
			arrayAppend(prc.errorMessages, "Password field is required.")
		}
		if (aUser.getBitIsActive() == "") {
			arrayAppend(prc.errorMessages, "Is Active field is required.")
		}
		if (aUser.getBitIsAdmin() == "") {
			arrayAppend(prc.errorMessages, "Is Admin field is required.")
		}
		
		return prc.errorMessages;
	}

	function getSuccessMessage(crudAction) {

		prc.successMessage = "";
	
		switch (crudAction) {
			case "Create":
				prc.successMessage = "Your new user was successfully created.";
				break;
			case "Update":
				prc.successMessage = "Your user was successfully updated.";
				break;
			case "Delete":
				prc.successMessage = "Your user was successfully deleted.";
				break;
		}	
		return prc.successMessage;
	}

	
	function getEmptyDomain() {
		
		return new models.domains.User();
	}

	// To fill in form values on creates
	function createEmptyUser() {

		prc.oneUser = getEmptyDomain();
        prc.oneUser.intUserID = 0;
        prc.oneUser.vcUserName = "";
		prc.oneUser.vcPassword = "";

		return prc.oneUser;
	}

}