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
	

	
	function getEmptyDomain() {
		
		return new models.domains.User();
	}


	function getSuccessMessage(aUser) {

		if (aUser.getIntUserID() > 0) {
			prc.successMessage = "Your user was successfully updated.";
		} else {
			prc.successMessage = "Your user was successfully created.";
		}
	
		return prc.successMessage;
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


	function buildCreateForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "";
		form.btnEnabled = "";
		form.btnIcon = "bi bi-person-plus";
		form.btnClass = "btn btn-primary mt-2";
		form.crudAction = "Create";
		form.formTitle = "Add User";

		form.oneUser = getEmptyDomain();
 
		// For radio buttons
		form.isActiveYes = '';
		form.isActiveNo = '';
		form.isAdminYes = '';
        form.isAdminNo = '';

		return form;
	}


	function buildUpdateForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "";
		form.btnEnabled = "";
		form.btnIcon = "bi bi-pen";
		form.btnClass = "btn btn-primary mt-2";
		form.crudAction = "Update";
		form.formTitle = "Edit User";

		form.oneUser = getOneUser(prc.intUserID);
		
		form.isActiveYes = isActiveYesChecked(form.oneUser.bitIsActive);
		form.isActiveNo = isActiveNoChecked(form.oneUser.bitIsActive);
		form.isAdminYes = isAdminYesChecked(form.oneUser.bitIsAdmin);
		form.isAdminNo = isAdminNoChecked(form.oneUser.bitIsAdmin);

		return form;
	}

	function buildDeleteForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "disabled";
        form.btnEnabled = "";
        form.btnIcon = "bi bi-person-x-fill";
        form.btnClass = "btn btn-danger mt-2";
        form.crudAction = "Delete";
        form.formTitle = "Delete User";

		form.oneUser = getOneUser(prc.intUserID);
		
		form.isActiveYes = isActiveYesChecked(form.oneUser.bitIsActive);
		form.isActiveNo = isActiveNoChecked(form.oneUser.bitIsActive);
		form.isAdminYes = isAdminYesChecked(form.oneUser.bitIsAdmin);
		form.isAdminNo = isAdminNoChecked(form.oneUser.bitIsAdmin);

		return form;
	}


	private function isActiveYesChecked(bitIsActive) {

		return (bitIsActive == 1) ? 'checked' : '';
	}


	private function isActiveNoChecked(bitIsActive) {

		return (bitIsActive == 1) ? '' : 'checked';
	}


	private function isAdminYesChecked(bitIsAdmin) {

		return (bitIsAdmin == 1) ? 'checked' : '';
	}


	private function isAdminNoChecked(bitIsAdmin) {

		return (bitIsAdmin == 1) ? '' : 'checked';
	}


}