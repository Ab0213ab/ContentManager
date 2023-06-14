component extends="coldbox.system.EventHandler" {

	property name="EmployeeService" inject="model:EmployeeService";

	/**
	 * Default Action
	 */
	function index(event, rc, prc) {

		// Exit Handlers
		prc.xeh.index = "main/index";
		prc.xeh.validateLogin = "main/validateLogin";

		session.isLoggedIn = false;

		prc.errorMessage = "";
		prc.errorClass = "";

		event.noLayout()
		event.setView( "main/index" );
	}

	 // Checks user credentials input and then routes to home page
	 function validateLogin( event, rc, prc ) {

		// Valid credentials
		prc.userNames = ["andrew", "Kevin", "admin"];
		prc.passwords = ["schaefer", "Barnes", "Admin"];

        // For when arriving at the handler from the login screen
        if (structKeyExists(rc, "isFormSubmission") && rc.isFormSubmission == "true") {

            if (trim(rc.vcUserName) == prc.userNames[1] && trim(rc.vcPassword) == prc.passwords[1]) {

				session.isLoggedIn = true;
				session.isAdmin = false;

            } else if (trim(rc.vcUserName) == prc.userNames[2] && trim(rc.vcPassword) == prc.passwords[2]) {

				session.isLoggedIn = true;
				session.isAdmin = true;

            } else if (trim(rc.vcUserName) == prc.userNames[3] && trim(rc.vcPassword) == prc.passwords[3]) {

				session.isLoggedIn = true;
				session.isAdmin = true;

            } else {

				prc.errorMessage = getErrorMessage(1);
				prc.errorClass = "alert alert-danger text-center";
                event.noLayout();
                event.setView( "main/index" );
                return;
			}
            session.vcUserName = trim(rc.vcUserName);
        }
		relocate(event="employee/index");
    }

	
    function getErrorMessage(errorCode) {

        prc.errorMessage = "";
        
        switch (errorCode) {
            case 1:
            prc.errorMessage = "Please enter a valid User Name and Password.";
            break;
			// Other error messages to be added
        }

        return prc.errorMessage;      
    }

	/**
	 * --------------------------------------------------------------------------
	 * Implicit Actions
	 * --------------------------------------------------------------------------
	 * All the implicit actions below MUST be declared in the config/Coldbox.cfc in order to fire.
	 * https://coldbox.ortusbooks.com/getting-started/configuration/coldbox.cfc/configuration-directives/coldbox#implicit-event-settings
	 */

	function onAppInit( event, rc, prc ){
	}

	function onRequestStart( event, rc, prc ) {

		// Exit Handlers used in navbar
		prc.xeh.validateLogin = "main/validateLogin";
		prc.xeh.viewEmployees = "employee/viewEmployees";
		prc.xeh.createCompany = "company/createCompany";
		prc.xeh.viewCompanies = "company/viewCompanies";
		prc.xeh.createUser = "user/createUser";
		prc.xeh.userIndex = "user/index";
		prc.xeh.index = "main/index";
		prc.xeh.getCnnContent = "employee/getCnnContent";
	}

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
