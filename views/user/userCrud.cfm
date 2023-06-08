<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>Add User Form</title>

		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="/includes/js/validateEmployeeForm.js"></script>
	</head>
	<body>
        <br>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-4">
					<div class="card p-3">
                        <center>
                            <h3>#prc.formTitle#</h3>
                        </center>
                        <p style="float: right">
                            <i class="bi bi-house-door-fill" style="color: blue"></i>
                            <a href="#event.buildLink(prc.xeh.validateLogin)#"> Home</a>
                        </p>
                        <hr>
                        
                        <form id="addUserForm" action="#event.buildLink(prc.xeh.save)#" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">

                                    <!-- Hidden fields -->
                                    <input type="hidden" name="crudAction" id="crudAction" value="#prc.crudAction ?: ''#">
                                    <cfif isDefined("prc.oneUser.intUserID") && len(prc.oneUser.intUserID)>
                                        <input type="hidden" name="intUserID" value="#prc.oneUser.intUserID#">
                                    </cfif>                                    
                                    
                                    <label for="vcUserName"><span style="color: red;">* </span>User Name</label>
                                    <input type="text" name="vcUserName" class="form-control" id="vcUserName" #prc.fieldsEnabled# 
                                    value="#prc.oneUser.vcUserName ?: ''#">
                                    <p id="vcUserNameMessage" style="color: red"></p>
                                <div class="form-group col-md-6">
                                    <label for="vcPassword"><span style="color: red;">* </span>Password</label>
                                    <input type="password" name="vcPassword" class="form-control" id="vcPassword" #prc.fieldsEnabled# 
                                    value="#prc.oneUser.vcPassword ?: ''#">
                                    <p id="vcPasswordMessage" style="color: red"></p>
                                </div>
                            </div>
                                <div class="form-group col-md-6">
                                    <label for="bitIsActive"><span style="color: red;">* </span>Is this User active?</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="bitIsActive" id="bitIsActiveYes" value="1">
                                        <label class="form-check-label" for="bitIsActiveYes">Yes</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="bitIsActive" id="bitIsActiveNo" value="0">
                                        <label class="form-check-label" for="bitIsActiveNo">No</label>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bitIsAdmin"><span style="color: red;">* </span>Is this User an administrator?</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="bitIsAdmin" id="bitIsAdminYes" value="1">
                                        <label class="form-check-label" for="bitIsAdminYes">Yes</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="bitIsAdmin" id="bitIsAdminNo" value="0">
                                        <label class="form-check-label" for="bitIsAdminNo">No</label>
                                    </div>
                                </div>
                            </div>
                                <div class="d-flex mt-3">
                                    <div>
                                        <button id="addUserBtn" #prc.btnEnabled# type="submit" class="#prc.btnClass#" 
                                         ><i class="#prc.btnIcon#" style="color: white"> </i>#prc.crudAction#
                                        </button>
                                    </div>
                                </div> 
                        </form>
                        
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






