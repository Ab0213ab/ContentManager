<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>ContentManager Login</title>

		<!-- Custom js file -->
		<script src="/includes/js/validateLoginForm.js"></script>
		<!-- jQuery MUST COME FIRST--> 
		<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>		

		<!-- Bootstrap 4 -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<!-- Bootstrap 4 -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

		<!-- Datatables -->
		<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
		<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.js"></script>

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

						<div class="#prc.errorClass#">
							<p>#prc.errorMessage#</p>
						</div>
						
						<!-- Login form -->
						<form id="userNameForm" action="#event.buildLink(prc.xeh.validateLogin)#" method="post">
							<div class="form-group">

								<!-- Hidden field sets flag for main handler -->
								<input type="hidden" name="isFormSubmission" value="true">
								<label for="vcUserName">User Name</label>
								<input type="text" id="vcUserName" name="vcUserName" class="form-control">
								<p id="vcUserNameMessage" style="color: red"></p>
							</div>
							<div class="form-group">
								<label for="vcPassword">Password</label>
								<input type="password" id="vcPassword" name="vcPassword" class="form-control">
								<p id="vcPasswordMessage" style="color: red"></p>
							</div>
							<div class="d-flex justify-content-end">
								<input id="loginFormBtn" onclick="return validateLoginForm();" type="submit" value="Sign In" 
								class="btn btn-primary float-end">
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
		<!-- jQuery -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
		
	</body>
	</html>
</cfoutput>

