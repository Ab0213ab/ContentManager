<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>Add Employee Form</title>
        
        <!-- Custom js file -->
        <script src="/includes/js/validateEmployeeForm.js"></script>
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
                        <hr> 
                        <form id="addEmployeeForm" action="#event.buildLink(prc.xeh.save)#" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    
                                    <!-- Hidden fields -->
                                    <input type="hidden" name="crudAction" id="crudAction" value="#prc.crudAction#">
                                    <cfif isDefined("prc.oneEmployee.intEmployeeID") && len(prc.oneEmployee.intEmployeeID)>
                                        <input type="hidden" name="intEmployeeID" value="#prc.oneEmployee.intEmployeeID#">
                                    </cfif>                                    
                                    
                                    <label for="vcLastName"><span style="color: red;">* </span>Last Name</label>
                                    <input type="text" name="vcLastName" class="form-control" id="vcLastName" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcLastName ?: ''#">
                                    <p id="vcLastNameMessage" style="color: red"></p>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="vcFirstName"><span style="color: red;">* </span>First Name</label>
                                    <input type="text" name="vcFirstName" class="form-control" id="vcFirstName" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcFirstName ?: ''#">
                                    <p id="vcFirstNameMessage" style="color: red"></p>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="vcTitle">Title</label>
                                    <input type="text" name="vcTitle" class="form-control" id="vcTitle" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcTitle ?: ''#">
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="vcTitleOfCourtesy">Title of Courtesy</label>
                                    <input type="text" name="vcTitleOfCourtesy" class="form-control" id="vcTitleOfCourtesy" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcTitleOfCourtesy ?: ''#">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="dtBirthDate">Birth Date</label>
                                    <input type="date" name="dtBirthDate" class="form-control" id="dtBirthDate" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.dtBirthDate ?: ''#">
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="dtHireDate">Hire Date</label>
                                    <input type="date" name="dtHireDate" class="form-control" id="dtHireDate" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.dtHireDate ?: ''#">
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="vcAddress">Address</label>
                                <input type="text" name="vcAddress" class="form-control" id="vcAddress" #prc.fieldsEnabled# 
                                value="#prc.oneEmployee.vcAddress ?: ''#">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="vcCity"><span style="color: red;">* </span>City</label>
                                    <input type="text" name="vcCity" class="form-control" id="vcCity" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcCity ?: ''#">
                                    <p id="vcCityMessage" style="color: red"></p>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="vcRegion"><span style="color: red;">* </span>Region</label>
                                    <input type="text" name="vcRegion" class="form-control" id="vcRegion" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcRegion ?: ''#">
                                    <p id="vcRegionMessage" style="color: red"></p>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="vcPostalCode">Postal Code</label>
                                        <input type="text" name="vcPostalCode" class="form-control" id="vcPostalCode" #prc.fieldsEnabled# 
                                        value="#prc.oneEmployee.vcPostalCode ?: ''#">
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="vcCountry">Country</label>
                                        <input type="text" name="vcCountry" class="form-control" id="vcCountry" #prc.fieldsEnabled# 
                                        value="#prc.oneEmployee.vcCountry ?: ''#">
                                    </div>
                                </div>
                                <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="vcHomePhone"><span style="color: red;">* </span>Home Phone</label>
                                    <input type="text" name="vcHomePhone" class="form-control" id="vcHomePhone" #prc.fieldsEnabled# 
                                    value="#prc.oneEmployee.vcHomePhone ?: ''#">
                                    <p id="vcHomePhoneMessage" style="color: red"></p>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="vcExtension">Extension</label>
                                        <input type="text" name="vcExtension" class="form-control" id="vcExtension" #prc.fieldsEnabled# 
                                        value="#prc.oneEmployee.vcExtension ?: ''#">
                                    </div>
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="vcNotes">Notes</label>
                                    <textarea class="form-control" name="vcNotes" id="vcNotes" rows="3" #prc.fieldsEnabled#
                                    >#prc.oneEmployee.vcNotes ?: ''#</textarea>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-12">
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
                                    <button id="addEmployeeBtn" onclick="return validateEmployeeForm();" #prc.btnEnabled# type="submit" class="#prc.btnClass#" 
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






