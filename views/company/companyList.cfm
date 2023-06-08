<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>Add Employee Form</title>

		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="/includes/js/validateEmployeeForm.js"></script>

        <!-- Display datatables -->
        <script>
            $(document).ready( function () {
                $('##companyTable').DataTable();
            } );
        </script>
	</head>
	<body>

    <!-- From PracticeApp for Modal-->
    <cfif structKeyExists(prc, "intCompanyKey")>
        <script>
          window.onload = function() {
            var myModal = new bootstrap.Modal(document.getElementById('displayEmployeesModal'), {});
            myModal.show();
          };
        </script>
      </cfif>

        <!-- Modal view (keep at top or else backdrop will take over the whole screen) -->
      <div class="modal" id="displayEmployeesModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Associated employees</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
       
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
      </div>
      <!-- End modal view -->


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
      
                        <div>
                            <table class="table table-striped" id="companyTable">
                                <thead>
                                    <tr>
                                      <th scope="col">Company Key</th>
                                      <th scope="col">Company Name</th>
                                      <th scope="col">Active?</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfloop query="#prc.allCompanies#">
                                        <tr>
                                          <td>#prc.allCompanies.intCompanyKey#</td>
                                          <td><a href="#event.buildLink(prc.xeh.companyList)#">#vcCompanyName#</td>
                                          <td>#prc.allCompanies.bitIsActive eq 1 ? "Yes" : "No"#</td>
                                        </tr>
                                    </cfloop>
                                </tbody>
                            </table>
                          <br>  
                        </div>
    
					</div>
				</div>
			</div>
            <br>
            <br>
            <br>
		</div>
		<!-- jQuery -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	</body>
	</html>
</cfoutput>






