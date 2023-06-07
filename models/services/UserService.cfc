component singleton accessors="true"{

	// Properties
    property name="UserGateway" inject="model:UserGateway";
	
	/**
	 * Constructor
	 */
	CompanyService function init() {

		return this;
	}

	// For selecting all users
	function getAllUsers(){

        var getAllUsers = UserGateway.getAllUsers();
        return getAllUsers;
    }

}