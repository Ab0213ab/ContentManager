<cfcomponent name="CompanyGateway" accessors="true" output="false">

    <cffunction name="getAllCompanies">
  
        <cfquery name="companyQuery" datasource="contentManager">
            SELECT 
              intCompanyKey,
              vcCompanyName,
              bitIsActive 
            FROM 
              tblCompany;
          </cfquery>
          <cfreturn companyQuery>
    </cffunction>


    <cffunction name="getEmployeesByCompanyKey" access="public" returntype="query">
      <cfargument name="intCompanyKey" type="numeric" required="true">
  
      <cfquery name="employeesByCompanyKeyQuery" datasource="contentManager">
          SELECT 
              tblCompany.intCompanyKey, 
              tblCompany.vcCompanyName, 
              tblEmployee.intEmployeeID, 
              tblEmployee.vcFirstName, 
              tblEmployee.vcLastName
          FROM 
              tblCompany
          INNER JOIN 
              tblEmployee 
          ON 
              tblCompany.intCompanyKey = tblEmployee.intCompanyKey
          WHERE 
              tblCompany.intCompanyKey = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.intCompanyKey#">
      </cfquery>
  
      <cfreturn employeesByCompanyKeyQuery>
    </cffunction>


    <cffunction name="create">
        <cfargument name="Company" required="true">
    
        <cfquery name="addNewCompanyQuery" datasource="contentManager">
    
          INSERT INTO 
            tblCompany 
            (
                vcCompanyName, 
                bitIsActive
            )
            VALUES ( 
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Company.getVcCompanyName()#">,
                <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Company.getBitIsActive()#">
            )
        </cfquery>   
    </cffunction>
  
    
  </cfcomponent>