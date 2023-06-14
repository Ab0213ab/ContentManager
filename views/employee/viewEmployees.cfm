<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>View Employees</title>

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
          $('##employeeTable').DataTable();
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
                            <a href="#event.buildLink(prc.xeh.createEmployee)#" class="btn btn-primary">
                                <i class="bi bi-person-plus" style="color: white"></i>
                                Add Employee
                            </a>
                        </center>
                        <hr>
                        <div>
                            <table class="table table-striped display" id="employeeTable">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col"></th>
                                        <th scope="col">Employee Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfloop query="#prc.allEmployees#">
                                    <tr>
                                        <td>
                                            <a href="#event.buildLink(prc.xeh.updateEmployee, {intEmployeeID = prc.allEmployees.intEmployeeID})#"
                                                class="btn btn-primary btn-sm">
                                                Edit
                                            </a>
                                        </td>
                                        <td>
                                            <a href="#event.buildLink(prc.xeh.deleteEmployee, {intEmployeeID = prc.allEmployees.intEmployeeID})#"
                                                class="btn btn-danger btn-sm">
                                                Delete
                                            </a>
                                        </td>
                                        <td>
                                            <a href="#event.buildLink(prc.xeh.readEmployee, {intEmployeeID = prc.allEmployees.intEmployeeID})#">
                                                #prc.allEmployees.vcFirstName# #prc.allEmployees.vcLastName#
                                            </a>
                                        </td>
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






