<!-- Andrew Schaefer -->

<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>ContentManager Home</title>

		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<style>
			.bordered-center {
				border: 2px solid ##379BC1;
				padding: 10px;
				margin-bottom: 15px;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<br>
		<br>
		<br>
		<div class="container">
			<center>	
				<h2 id="welcomeMessage">#prc.welcomeMessage#</h2>
			</center>
			<br>
			<br>
			<div class="row justify-content-center">

				<!-- Display messages -->
				<cfif structKeyExists(prc, "message") AND prc.message NEQ "">
					<div class="alert alert-success text-center">
						#prc.message#
					</div>
				</cfif>

				<!-- Display messages -->
				<cfif structKeyExists(prc, "errorMessages")>
					<div class="alert alert-danger text-center">
						<cfdump var="#prc.errorMessages#">
					</div>
				</cfif>
				
				<!--- Company Card --->
				<div class="col-md-6">
					<div class="card p-3">
						<form id="companiesForm" action="#event.buildLink(prc.xeh.employeeIndex)#" method="post">
							<div class="form-group">
								<div class="bordered-center">
									<h5>Companies</h5>
								</div>
								<select class="form-control" onchange="this.form.submit()" name="intCompanyKey" id="companiesSelect">
									<option value="">Select a Company</option>
									<cfloop query="prc.allCompanies">
									<option value="#prc.allCompanies.intCompanyKey#">#prc.allCompanies.vcCompanyName#</option>
									</cfloop>
							  	</select>
							</div>
							<!-- Hidden field -->
							<input type="hidden" name="isCompanyFormSubmission" id="isCompanyFormSubmission" value="true">
						  </form>
						  <br>
						  
						  <cfif structKeyExists(prc, "employeesByCompanyKey")>
							<cfloop query="#prc.employeesByCompanyKey#">
							  <div class="d-flex align-items-center">
								<a href="#event.buildLink(prc.xeh.updateEmployee, {intEmployeeID = prc.employeesByCompanyKey.intEmployeeID})#"
								  class="btn btn-primary btn-sm m-2">
								  Edit
								</a>
								<a href="#event.buildLink(prc.xeh.deleteEmployee, {intEmployeeID = prc.employeesByCompanyKey.intEmployeeID})#"
								  class="btn btn-danger btn-sm">
								  Delete
								</a>
								<a href="#event.buildLink(prc.xeh.readEmployee, {intEmployeeID = prc.employeesByCompanyKey.intEmployeeID})#"
								  class="m-2">
								  #prc.employeesByCompanyKey.vcFirstName# #prc.employeesByCompanyKey.vcLastName#
								</a>
							  </div>
							</cfloop>
						  </cfif> 
						<br> 
                    </div>
				</div>

				<!--- User Card --->
				<div class="col-md-6">
					<div class="card p-3">
						<form id="UsersForm" action="#event.buildLink(prc.xeh.employeeIndex)#" method="post">
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
							<cfloop query="#prc.aUser#">
							  <div class="d-flex align-items-center">
								<ul>
								  <li>User Name: #prc.aUser.vcUserName#</li>
								  <li>Active?: #prc.aUser.bitIsActive eq 1 ? "Yes" : "No"#</li>
  								  <li>Admin?: #prc.aUser.bitIsAdmin eq 1 ? "Yes" : "No"#</li>
								</ul>
							  </div>
							</cfloop>
						  </cfif> 
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

