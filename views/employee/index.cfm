<!-- Andrew Schaefer -->

<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>ContentManager Home</title>

		<!---
			CSS
			- Bootstrap
			- Alpine.js
		--->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
		
		<link rel="stylesheet" type="text/css" href="/includes/css/app.css"/>
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
				<div class="#prc.successClass#">
					#prc.successMessage#
				</div>

				<!-- Display messages -->
				<div class="#prc.errorClass#">
					<cfloop array="#prc.errorMessages#" index="i">
						<p>#i#</p>
					</cfloop>
				</div>
				
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
				
			</div>
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

