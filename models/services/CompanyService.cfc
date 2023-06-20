component singleton accessors="true"{

	// Properties
    property name="CompanyGateway" inject="model:CompanyGateway";
	
	/**
	 * Constructor
	 */
	CompanyService function init(){

		return this;
	}

	// For selecting all companies
	function getAllCompanies(){

        var getAllCompanies = CompanyGateway.getAllCompanies();
        return getAllCompanies;
    }

	// For selecting all companies and their associated employees
	function getEmployeesByCompanyKey(intCompanyKey){

		var employeesByCompanyKey = CompanyGateway.getEmployeesByCompanyKey(intCompanyKey);
		return employeesByCompanyKey;
	}

	function getOneCompany(intCompanyKey) {

		var getOneCompany = CompanyGateway.getOneCompany(intCompanyKey);
        return getOneCompany;
	}


	function delete(aCompany) {

		CompanyGateway.delete(aCompany);
		session.successMessage = "Your company was successfully deleted."

	}


	function validate(aCompany) {

		prc.errorMessages = [];

		if (aCompany.getVcCompanyName() == "") {
			arrayAppend(prc.errorMessages, "Company Name field is required.")
		}
		if (aCompany.getBitIsActive() == "") {
			arrayAppend(prc.errorMessages, "Is Active field is required.")
		}
		
		return prc.errorMessages;
	}
	

	function getSuccessMessage(aCompany) {

		if (aCompany.getIntCompanyKey() > 0) {
			prc.successMessage = "Your company was successfully updated.";
		} else {
			prc.successMessage = "Your new company was successfully created.";
		}

		return prc.successMessage;
	}


	function getEmptyDomain() {

		return new models.domains.Company();
	}


	function save(aCompany) { 

		if (aCompany.getIntCompanyKey() == 0) {
			CompanyGateway.create(aCompany);
		} else {
			CompanyGateway.update(aCompany);
		}	
	}

	function buildCreateForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "";
		form.btnEnabled = "";
		form.btnIcon = "bi bi-person-plus";
		form.btnClass = "btn btn-primary mt-2";
		form.crudAction = "Create";
		form.formTitle = "Add Company";

		form.oneCompany = getEmptyDomain();
 
		// For radio buttons
		form.isActiveYes = '';
		form.isActiveNo = '';

		return form;
	}


	function buildUpdateForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "";
		form.btnEnabled = "";
		form.btnIcon = "bi bi-pen";
		form.btnClass = "btn btn-primary mt-2";
		form.crudAction = "Update";
		form.formTitle = "Edit Company";

		form.oneCompany = getOneCompany(prc.intCompanyKey);
		
		form.isActiveYes = isActiveYesChecked(form.oneCompany.bitIsActive);
		form.isActiveNo = isActiveNoChecked(form.oneCompany.bitIsActive);

		return form;
	}

	function buildDeleteForm(event, prc, rc) {

		var form = {};

		form.fieldsEnabled = "disabled";
        form.btnEnabled = "";
        form.btnIcon = "bi bi-person-x-fill";
        form.btnClass = "btn btn-danger mt-2";
        form.crudAction = "Delete";
        form.formTitle = "Delete Company";

		form.oneCompany = getOneCompany(prc.intCompanyKey);
		
		form.isActiveYes = isActiveYesChecked(form.oneCompany.bitIsActive);
		form.isActiveNo = isActiveNoChecked(form.oneCompany.bitIsActive);

		return form;
	}


	private function isActiveYesChecked(bitIsActive) {

		return (bitIsActive == 1) ? 'checked' : '';
	}


	private function isActiveNoChecked(bitIsActive) {

		return (bitIsActive == 1) ? '' : 'checked';
	}

	


}