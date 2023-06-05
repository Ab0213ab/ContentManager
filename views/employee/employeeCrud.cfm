<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>Add Employee Form</title>

		<!-- Bootstrap -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" 
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="/includes/js/validateEmployeeForm.js"></script>
	</head>
	<body>
        <br>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card p-3">
                        <center>
                            <h3>#prc.formTitle#</h3>
                        </center>
                        <p style="float: right">
                            <i class="bi bi-house-door-fill" style="color: blue"></i>
                            <a href="#event.buildLink(prc.xeh.validateLogin)#"> Home</a>
                        </p>
                        
                        <form id="addEmployeeForm" action="#event.buildLink(prc.xeh.save)#" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-6">

                                    <!-- Hidden fields -->
                                    <input type="hidden" name="crudAction" id="crudAction" value="#prc.crudAction ?: ''#">
                                    <input type="hidden" name="intEmployeeID" value="#prc.oneEmployee.intEmployeeID ?: ''#">
                                    
                                    <label for="vcLastName">Last Name</label>
                                    <input type="text" name="vcLastName" class="form-control" id="vcLastName" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcLastName ?: ''#">
                                    <p id="vcLastNameMessage" style="color: red"></p>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vcFirstName">First Name</label>
                                    <input type="text" name="vcFirstName" class="form-control" id="vcFirstName" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcFirstName ?: ''#">
                                    <p id="vcFirstNameMessage" style="color: red"></p>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="vcTitle">Title</label>
                                    <input type="text" name="vcTitle" class="form-control" id="vcTitle" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcTitle ?: ''#">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="vcTitleOfCourtesy">Title of Courtesy</label>
                                    <input type="text" name="vcTitleOfCourtesy" class="form-control" id="vcTitleOfCourtesy" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcTitleOfCourtesy ?: ''#">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="dtBirthDate">Birth Date</label>
                                    <input type="date" name="dtBirthDate" class="form-control" id="dtBirthDate" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.dtBirthDate ?: ''#">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="dtHireDate">Hire Date</label>
                                    <input type="date" name="dtHireDate" class="form-control" id="dtHireDate" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.dtHireDate ?: ''#">
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="vcAddress">Address</label>
                                <input type="text" name="vcAddress" class="form-control" id="vcAddress" #prc.fieldsEnabled# 
                                value="#prc.oneEmployee.vcAddress ?: ''#">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="vcCity">City</label>
                                    <input type="text" name="vcCity" class="form-control" id="vcCity" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcCity ?: ''#">
                                    <p id="vcCityMessage" style="color: red"></p>
                                </div>
                                <div class="form-group col-md-6">
                                        <label for="vcRegion">Region</label>
                                        <input type="text" name="vcRegion" class="form-control" id="vcRegion" #prc.fieldsEnabled# 
                                        value="#prc.oneEmployee.vcRegion ?: ''#">
                                        <p id="vcRegionMessage" style="color: red"></p>
                                    </div>
                                </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                        <label for="vcPostalCode">Postal Code</label>
                                        <input type="text" name="vcPostalCode" class="form-control" id="vcPostalCode" #prc.fieldsEnabled# 
                                        value="#prc.oneEmployee.vcPostalCode ?: ''#">
                                    </div>
                                <div class="form-group col-md-6">
                                        <label for="vcCountry">Country</label>
                                        <input type="text" name="vcCountry" class="form-control" id="vcCountry" #prc.fieldsEnabled# 
                                        value="#prc.oneEmployee.vcCountry ?: ''#">
                                    </div>
                                </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                        <label for="vcHomePhone">Home Phone</label>
                                        <input type="text" name="vcHomePhone" class="form-control" id="vcHomePhone" #prc.fieldsEnabled# 
                                        value="#prc.oneEmployee.vcHomePhone ?: ''#">
                                        <p id="vcHomePhoneMessage" style="color: red"></p>
                                    </div>
                                <div class="form-group col-md-6">
                                        <label for="vcExtension">Extension</label>
                                        <input type="text" name="vcExtension" class="form-control" id="vcExtension" #prc.fieldsEnabled# 
                                        value="#prc.oneEmployee.vcExtension ?: ''#">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="vcNotes">Notes</label>
                                    <textarea class="form-control" name="vcNotes" id="vcNotes" rows="3" #prc.fieldsEnabled#
                                    >#prc.oneEmployee.vcNotes ?: ''#</textarea>
                                </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="intCompanyKey">Company</label>
                                    <select name="intCompanyKey" class="form-control" #prc.fieldsEnabled# id="intCompanyKey">
                                        <cfloop query="prc.allCompanies">
                                            <option value="#intCompanyKey#">#vcCompanyName#</option>
                                        </cfloop>
                                    </select>
                                </div>                        
                            </div>
                                <div class="d-flex mt-3">
                                    <div>
                                        <button id="addEmployeeBtn" #prc.btnEnabled# type="submit" class="#prc.btnClass#" 
                                        onclick="return validateEmployeeForm();" ><i class="#prc.btnIcon#" style="color: white"> </i>#prc.crudAction#
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






