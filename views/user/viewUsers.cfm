<cfoutput>
    
	<!DOCTYPE html>
	<html>
        <head>
            <title>Add User Form</title>
            
            <script src="/includes/js/validateUserForm.js"></script>
            
             <!-- Bootstrap -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

            <!-- jQuery, Popper -->
            <script src="https://code.jquery.com/jquery-3.7.0.js" 
            integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" 
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" 
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

            <!-- DataTables -->
            <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
            <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>

            <script>
                $(document).ready( function () {
                    $('##userTable').DataTable({
                        "columnDefs": [{
                            "targets": 1, 
                            "render": function ( data, type, row ) {
                                return data == "Yes" ? data + '  <span style="color:green;">&check;</span>' : data;
                            }
                        }]
                    });
                } );
            </script> 
            <link rel="stylesheet" type="text/css" href="/includes/css/app.css"/>   
        </head>
        <body>
            <br>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card p-3">
                            <center class="bordered-center">
                                <h3>#prc.formTitle#</h3>
                            </center>
                        <p style="float: right">
                            <i class="bi bi-house-door-fill" style="color: blue"></i>
                            <a href="#event.buildLink(prc.xeh.validateLogin)#"> Home</a>
                        </p>
                        <center>
                            <a href="#event.buildLink(prc.xeh.createUser)#" class="btn btn-primary">
                                <i class="bi bi-person-check-fill" style="color: white"></i>
                                Add User
                            </a>
                        </center>
                        
                        <hr>
                        <!--- User Card --->
                        <div class="col-md-12">
                            <div class="card p-3">
                                <table class="table table-striped display" id="userTable">
                                    <thead>
                                      <tr>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                        <th scope="col">User Name</th>
                                        <th scope="col">Active?</th>
                                        <th scope="col">Admin?</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                        <cfloop query="#prc.allUsers#">
                                            <tr>
                                                <td>
                                                    <a href="#event.buildLink(prc.xeh.updateUser, {intUserID = prc.allUsers.intUserID})#"
                                                        class="btn btn-primary btn-sm">
                                                        Edit
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="#event.buildLink(prc.xeh.deleteUser, {intUserID = prc.allUsers.intUserID})#"
                                                        class="btn btn-danger btn-sm">
                                                        Delete
                                                    </a>
                                                </td>
                                                <td>#prc.allUsers.vcUserName#</td>
                                                <td>#prc.allUsers.bitIsActive#</td>
                                                <td>#prc.allUsers.bitIsAdmin#</td> 
                                            </tr>
                                        </cfloop>
                                    </tbody>
                                  </table>

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
