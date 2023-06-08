<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>Add Company Form</title>

		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="/includes/js/validateCompanyForm.js"></script>
        <script>
            function validateCompanyForm() {
                var isValid = true;
    
                var hiddenFieldCrudAction = document.getElementById('crudAction');
                var vcCompanyName = document.getElementById('vcCompanyName');
                var bitIsActive = document.querySelector('input[name="bitIsActive"]:checked');
    
                if (hiddenFieldCrudAction.value == 'delete') {
                    isValid = true;
                    return;
                } else {    
                    if (vcCompanyName.value == "") {
                        document.getElementById('vcCompanyNameMessage').innerHTML = "This field is required.";
                        isValid = false;
                    }
                    if (!bitIsActive) {
                        document.getElementById('bitIsActiveMessage').innerHTML = "This field is required.";
                        isValid = false;
                    }
                }
    
                return isValid;
            }
        </script>
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
                        
                        <form id="addCompanyForm" action="#event.buildLink(prc.xeh.save)#" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">

                                    <!-- Hidden fields -->
                                    <input type="hidden" name="crudAction" id="crudAction" value="#prc.crudAction ?: ''#">
                                    <cfif isDefined("prc.oneCompany.intCompanyID") && len(prc.oneCompany.intCompanyID)>
                                        <input type="hidden" name="intCompanyID" value="#prc.oneCompany.intCompanyID#">
                                    </cfif>                                    
                                    
                                    <label for="vcCompanyName"><span style="color: red;">* </span>Company Name</label>
                                    <input type="text" name="vcCompanyName" class="form-control" id="vcCompanyName" #prc.fieldsEnabled# 
                                    value="#prc.oneCompany.vcCompanyName ?: ''#">
                                    <p id="vcCompanyNameMessage" style="color: red"></p>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="bitIsActive"><span style="color: red;">* </span>Is this company still active?</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="bitIsActive" id="bitIsActiveYes" value="1">
                                        <label class="form-check-label" for="bitIsActiveYes">Yes</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="bitIsActive" id="bitIsActiveNo" value="0">
                                        <label class="form-check-label" for="bitIsActiveNo">No</label>
                                        <p id="bitIsActiveMessage" style="color: red"></p>
                                    </div>
                                </div>
                            </div>
                                <div class="d-flex mt-3">
                                    <div>
                                        <button id="addCompanyBtn" onclick="return validateCompanyForm();" #prc.btnEnabled# type="submit" class="#prc.btnClass#" 
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






