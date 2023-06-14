<cfoutput>
    <!doctype html>
    <html lang="en">
    <head>
        <!--- Metatags --->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="ColdBox Application Template">
        <meta name="author" content="Mind Over Data">
    
        <!---Base URL --->
        <base href="#event.getHTMLBaseURL()#" />
    
        <!---
            CSS
            - Bootstrap
            - Alpine.js
        --->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        
        <style>
            .text-blue { color:##379BC1; }
        </style>
    
        <!--- Title --->
        <title>Welcome to ContentManager!</title>
    </head>
    <body
        data-spy="scroll"
        data-target=".navbar"
        data-offset="50"
        style="padding-top: 60px"
        class="d-flex flex-column h-100"
    >
        <!---Top NavBar --->
        <header style="margin:20px">
            <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-image: linear-gradient(to right, ##000B4D, ##379BC1);">
                <div class="container-fluid">
                    <!---Brand --->
                    <a class="navbar-brand" href="#event.buildLink(prc.xeh.validateLogin)#">
                        <img src="/includes/images/MODLOGO.png" alt="Logo" width="100" height="45" class="d-inline-block align-text-top" style="border: 1px solid white;">
                    </a>
    
                    <!--- Mobile Toggler --->
                    <button
                        class="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="##navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                    >
                        <span class="navbar-toggler-icon"></span>
                    </button>
    
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="navbar-nav">
                            <a class="nav-item nav-link active" href="#event.buildLink(prc.xeh.viewEmployees)#">Employees</a>
                            <a class="nav-item nav-link active" href="#event.buildLink(prc.xeh.viewCompanies)#">Companies</a>  
                            <a class="nav-item nav-link active" href="#event.buildLink(prc.xeh.userIndex)#">Users</a>
                            <a class="nav-item nav-link active" href="#event.buildLink(prc.xeh.getCnnContent)#">CNN</a>
                          </div>
                          
                        <div class="navbar-nav ms-auto"> 
                            <a class="nav-item nav-link active" href="#event.buildLink(prc.xeh.index)#"
                            ><i class="bi bi-person-circle" style="color: white"></i> Logout</a>
                        </div>
                    </div>
                </div>
            </nav>   
        </header>
    
        <!---Container And Views --->
        <main class="flex-shrink-0">
            #renderView()#
        </main>
    
        <!-- Footer -->
        <!---<footer class="w-100 bottom-0 position-fixed border-top py-3 mt-5 bg-light">
            <div class="container">
                <p>
                    ContentManager is an onboarding software project built by <a href="https://github.com/Ab0213ab" target="blank">Andrew B. Schaefer</a> for 
                    <a href="https://www.mind-over-data.com" target="blank">Mind Over Data, LLC.</a>
                </p>
            </div>
        </footer>--->
    
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
    