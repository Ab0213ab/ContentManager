<cfoutput>
    
	<!DOCTYPE html>
	<html>
        <head>
            <title>Add User Form</title>
            
            <script src="/includes/js/validateUserForm.js"></script>
            
            <!---
                CSS
                - Bootstrap
                - Alpine.js
            --->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

            <!-- DataTables -->
            <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
            <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>

            <script>
            $(document).ready( function () {
                $('##userTable').DataTable();
            } );
            </script>
            
        </head>
        <body>
            <br>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card p-3">
                            <center>
                                <h3>#prc.formTitle#</h3>
                            </center>
                        <p style="float: right">
                            <i class="bi bi-house-door-fill" style="color: blue"></i>
                            <a href="#event.buildLink(prc.xeh.validateLogin)#"> Home</a>
                        </p>
                        <hr>
                        <!--- User Card --->
                        <div class="col-md-12">
                            <div class="card p-3">
                                    <form id="UsersForm" action="#event.buildLink(prc.xeh.userIndex)#" method="post">
                                        <div class="form-group">
                                            <div class="bordered-center">
                                                <h5>Users</h5>
                                            </div>
                                            <select class="form-control" onchange="this.form.submit()" name="intUserID" id="usersSelect">
                                                <option value="">Select a User</option>
                                                <cfloop query="prc.allUsers">
                                                    <option value="#prc.allUsers.intUserID#">#prc.allUsers.vcUserName#</option>
                                                </cfloop>
                                            </select>
                                        </div>
                                        <!-- Hidden field -->
                                        <input type="hidden" name="isUserFormSubmission" id="isUserFormSubmission" value="true">
                                    </form>
                                    <br>
                                    <cfif structKeyExists(prc, "aUser")>
                                        <table class="table table-striped display" id="userTable">
                                            <thead>
                                                <tr>
                                                    <th scope="col">User Name</th>
                                                    <th scope="col">Active?</th>
                                                    <th scope="col">Admin?</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <cfloop query="#prc.aUser#">
                                                <tr>
                                                  <td>#prc.aUser.vcUserName#</td>
                                                  <td>#prc.aUser.bitIsActive eq 1 ? "Yes" : "No"#</td>
                                                  <td>#prc.aUser.bitIsAdmin eq 1 ? "Yes" : "No"#</td>
                                                </tr>
                                            </cfloop>
                                            </tbody>
                                        </table>
                                    </cfif>
                                </div>
                            </div>  
					    </div>
				    </div>
			    </div>
            <br>
            <br>
            <br>
		    </div>
        <!---
            JavaScript
            - Bootstrap
            - Popper
            - Alpine.js
        --->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
	    </body>
    </html>
</cfoutput>
