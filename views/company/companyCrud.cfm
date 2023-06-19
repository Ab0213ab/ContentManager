<cfoutput>

	<!DOCTYPE html>
	<html>
	<head>
		<title>Add Company Form</title>
        <script src="/includes/js/validateCompanyForm.js"></script>

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
				<div class="col-md-4">
					<div class="card p-3">
                        <center class="bordered-center">
                            <h3>#prc.formTitle#</h3>
                        </center>
                        <p style="float: right">
                            <i class="bi bi-house-door-fill" style="color: blue"></i>
                            <a href="#event.buildLink(prc.xeh.validateLogin)#"> Home</a>
                        </p>
                        <hr>
                        
                        <form id="addCompanyForm" action="#event.buildLink(prc.xeh.save)#" method="post">
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    
                                    <!-- Hidden fields -->
                                    <input type="hidden" name="intCompanyKey" value="#prc.oneCompany.intCompanyKey#">
                                
                                    <label for="vcCompanyName"><span style="color: red;">* </span>Company Name</label>
                                    <input type="text" name="vcCompanyName" class="form-control" id="vcCompanyName" #prc.fieldsEnabled# 
                                    value="#prc.oneCompany.vcCompanyName#">
                                    <p id="vcCompanyNameMessage" style="color: red"></p>
                                </div>


                                <div class="form-group col-md-12">
                                    <label for="bitIsActive"><span style="color: red;">* </span>Is this company still active?</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="bitIsActive" id="bitIsActiveYes" 
                                        value="#prc.oneCompany.bitIsActive#" #prc.fieldsEnabled# #prc.isActiveYes#>
                                        <label class="form-check-label" for="bitIsActiveYes">Yes</label>
                                        <br>
                                        <input class="form-check-input" type="radio" name="bitIsActive" id="bitIsActiveNo" 
                                        value="#prc.oneCompany.bitIsActive#" #prc.fieldsEnabled# #prc.isActiveNo#>
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
        <!---
        JavaScript
        - Bootstrap
        - Popper
        - Alpine.js
        --->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
        <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>

</html>
</cfoutput>






