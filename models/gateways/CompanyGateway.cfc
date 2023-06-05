<cfcomponent name="CompanyGateway" accessors="true" output="false">

    <cffunction name="getAllCompanies">
  
        <cfquery name="companyQuery" datasource="contentManager">
            SELECT intCompanyKey,
            vcCompanyName,
            bitIsActive 
            FROM tblCompany;
          </cfquery>
          <cfreturn companyQuery>
  
    </cffunction>
    
  </cfcomponent>