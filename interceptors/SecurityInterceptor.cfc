component extends="coldbox.system.Interceptor" cache="false" {

    function configure(){}

    function preEvent(event, interceptData, rc, prc) {

        var currentEvent = event.getCurrentEvent();
        // Skip interceptor for the login form and login validation events
        if (currentEvent != "main.index" && currentEvent != "main.validateLogin") {

            // Checks if the user is logged in
            if (!session.keyExists("isLoggedIn") || !session.isLoggedIn) {

                // Redirects the user to the login page
                event.overrideEvent("main.index");
            }
        }
    }

}



