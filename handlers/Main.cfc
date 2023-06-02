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

		event.noLayout()
		event.setView( "main/index" );

	}

	 // Checks user credentials input and then routes to home page
	 function validateLogin( event, rc, prc ) {

        // For when arriving at the handler from the login screen
        if (structKeyExists(rc, "isFormSubmission") && rc.isFormSubmission == "true") {

            if (trim(rc.vcUserName) != "a" && trim(rc.vcPassword) != "s") {

                prc.errorMessage = "Please enter a valid User Name and Password.";
                event.noLayout();
                event.setView( "main/index" );
                return;

            } else if (trim(rc.vcUserName) != "a") {

                prc.errorMessage = "Please enter a valid User Name.";
                event.noLayout();
                event.setView( "main/index" );
                return;

            } else if (trim(rc.vcPassword) != "s") {

                prc.errorMessage = "Please enter a valid Password.";
                event.noLayout();
                event.setView( "main/index" );
                return;

            } else {
				session.isLoggedIn = true;
			}
            session.vcUserName = trim(rc.vcUserName);
        }
		relocate(event="employee/index");
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
		prc.xeh.createEmployee = "employee/createEmployee";
		prc.xeh.index = "main/index";
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
