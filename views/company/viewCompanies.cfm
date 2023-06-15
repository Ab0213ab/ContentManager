<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>View Companies</title>

    <script src="/includes/js/submitFormWithKey.js"></script>

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
    <link rel="stylesheet" type="text/css" href="/includes/css/app.css"/>   
	</head>
	<body>

    <!--- Modals removed in version 2.0 as functionality was redundant --->

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
              <div class="#prc.successClass#">
                #prc.successMessage#
              </div>
            </center>
    
            <center>
              <div class="#prc.errorClass#">
                <cfloop array="#prc.errorMessages#" index="i">
                  <p>#i#</p>
                </cfloop>
              </div>
            </center>

            <center>
              <a href="#event.buildLink(prc.xeh.createCompany)#" class="btn btn-primary">
                  <i class="bi bi-building" style="color: white"></i>
                  Add Company
              </a>
          </center>
            <hr>
            <div>
              <table class="table table-striped display" id="companyTable">
                <thead>
                  <tr>
                    <th scope="col"></th>
                    <th scope="col"></th>
                    <th scope="col">Company Name</th>
                    <th scope="col">Active?</th>
                  </tr>
                </thead>
                <tbody>
                    <cfloop query="#prc.allCompanies#">
                        <tr>
                          <td>
                            <a href="#event.buildLink(prc.xeh.updateCompany, {intCompanyKey = prc.allCompanies.intCompanyKey})#"
                                class="btn btn-primary btn-sm">
                                Edit
                            </a>
                          </td>
                          <td>
                            <a href="#event.buildLink(prc.xeh.deleteCompany, {intCompanyKey = prc.allCompanies.intCompanyKey})#"
                                class="btn btn-danger btn-sm">
                                Delete
                            </a>
                          </td>
                          <td>#prc.allCompanies.vcCompanyName#</td>
                          <td>#prc.allCompanies.bitIsActive#</td>
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

	</body>
	</html>
</cfoutput>







