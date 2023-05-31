<!-- Andrew Schaefer -->

<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>ContentManager Login</title>

		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

	</head>
	<body>
		<br>
		<br>
		<br>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="card p-3">
						<center><img width="100" role="img" src="/includes/images/MODLOGO2.png"></center>
						<center><h2 id="signIn">Sign In</h2></center>

						 <!-- Display messages -->
						 <cfif structKeyExists(prc, "errorMessage")>
							<cfswitch expression="#prc.errorMessage#">

								<cfcase value="1">
									<div class="alert alert-danger">
										<p>Please enter a correct user name.</p>
									</div>
								</cfcase>
								
								<cfcase value="2">
									<div class="alert alert-danger">
										<p>Please enter a correct password.</p>
									</div>
								</cfcase>
								
								<cfcase value="3">
									<div class="alert alert-danger">
										<p>Please enter a correct username and password.</p>
									</div>
								</cfcase>

							</cfswitch>
						  </cfif>
						
						<!-- Login form -->
						<form id="userNameForm" action="#event.buildLink(prc.xeh.validateLogin)#" method="post">
							<div class="form-group">

								<!-- Hidden field sets flag for main handler -->
								<input type="hidden" name="isFormSubmission" value="true">
								<label for="userName">User Name</label>
								<input type="text" id="userName" name="userName" class="form-control">
							</div>
							<div class="form-group">
								<label for="password">Password</label>
								<input type="password" id="password" name="password" class="form-control">
							</div>
							<div class="d-flex justify-content-end">
								<input id="userNameFormBtn" type="submit" value="Sign In" class="btn btn-primary float-end" style="margin: 10px">
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
		<!-- jQuery -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	</body>
	</html>
</cfoutput>

