<!-- Andrew Schaefer -->

<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>ContentManager Home</title>

		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	</head>
	<body>
		<br>
		<br>
		<br>
		<br>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<center>	
						<h2 id="welcomeMessage">#prc.welcomeMessage#</h2>
					</center>
					<br>

					<!-- Display messages -->
					<cfif structKeyExists(prc, "message") AND prc.message NEQ "">
    					<div class="alert alert-success text-center">
        					#prc.message#
   						</div>
					</cfif>

					<cfdump var = "#session.isLoggedIn#">

					<div class="card p-3">
						<center>
							<a href="#event.buildLink(prc.xeh.createEmployee, {intEmployeeID = prc.allEmployees.intEmployeeID})#" 
							class="btn btn-primary" style="width: 50%;"
							><i class="bi bi-person-plus" style="color: white"></i> Add Employee</a>
						</center>
						<hr>
							<cfloop query="prc.allEmployees">
								<div>
									<a href="#event.buildLink(prc.xeh.updateEmployee, {intEmployeeID = prc.allEmployees.intEmployeeID})#" 
									style="margin: 10px">
										Edit
									</a>
									<a class="ms-4" href="#event.buildLink(prc.xeh.readEmployee, {intEmployeeID = prc.allEmployees.intEmployeeID})#">
										#prc.allEmployees.vcFirstName# #prc.allEmployees.vcLastName#
									</a>
									<a href="#event.buildLink(prc.xeh.deleteEmployee, {intEmployeeID = prc.allEmployees.intEmployeeID})#" 
									style="float: right; color: red">
										Delete
									</a>
								</div>
							</cfloop>
						<br>   
                    </div>
				</div>
			</div>
		</div>
		<!-- jQuery -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	</body>
	</html>
</cfoutput>

