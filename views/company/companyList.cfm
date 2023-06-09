<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>View Companies</title>

    <script src="/includes/js/submitFormWithKey.js"></script>
    <script src="/includes/js/displayEmployeesModal.js"></script>

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
          $('##companyTable').DataTable();
      } );
    </script>
	</head>
	<body>

    <cfif structKeyExists(prc, "displayModal")>
      <script>
        window.onload = function() {
          var theModal = new bootstrap.Modal(document.getElementById('displayEmployeesModal'), {});
          theModal.show();
        };
      </script>
    </cfif>

    <!-- Modal view (keep at top or else backdrop will take over the whole screen) -->
    <div class="modal" id="displayEmployeesModal">
      <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                  <h4 class="modal-title">Associated employees</h4>
                  <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
              </div>
              <div class="modal-body">

                <cfif structKeyExists(prc, "displayModal")>
                  <cfloop query="#prc.employeesByCompanyKey#">
                    <div class="d-flex align-items-center">
                      <ul>
                        <li>#prc.employeesByCompanyKey.vcFirstName# #prc.employeesByCompanyKey.vcLastName#</li>
                      </ul>
                    </div>
                  </cfloop>
                </cfif>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
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
              <form id="companyListForm" action="#event.buildLink(prc.xeh.companyList)#" method="post">
                <!-- Hidden field -->
                <input type="hidden" name="intCompanyKey" id="intCompanyKey">
                <input type="hidden" name="isCompanyTableSubmission" id="isCompanyTableSubmission" value="true">
                <table class="table table-striped display" id="companyTable">
                  <thead>
                    <tr>
                      <th scope="col">Company Name</th>
                      <th scope="col">Active?</th>
                    </tr>
                  </thead>
                  <tbody>
                      <cfloop query="#prc.allCompanies#">
                          <tr>
                            <td>
                              <a href="javascript:{}" 
                                  onclick="submitFormWithKey('companyListForm', '#prc.allCompanies.intCompanyKey#');">
                                #prc.allCompanies.vcCompanyName#
                              </a>
                            </td>
                            <td>#prc.allCompanies.bitIsActive eq 1 ? "Yes" : "No"#</td>
                          </tr>
                      </cfloop>
                  </tbody>
                </table>
              </form>
              
              <br>  
            </div>
					</div>
				</div>
			</div>
      <br>
      <br>
      <br>
		</div> 

	</body>
	</html>
</cfoutput>






