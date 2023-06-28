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


	function validate(aUser) {

		prc.errorMessages = [];

		if (trim(aUser.getVcUserName()) == "") {
			arrayAppend(prc.errorMessages, "User Name field is required.")
		}
		if (trim(aUser.getVcPassword()) == "") {
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
	

	
	function getEmptyDomain() {
		
		return new models.domains.User();
	}


	function save(aUser) { 

		if (aUser.getIntUserID() == 0) {
			UserGateway.create(aUser);
		} else {
			UserGateway.update(aUser);
		}
		
	}

	function delete(aUser) {

		UserGateway.delete(aUser);
		session.successMessage = "Your user was successfully deleted."

	}


}