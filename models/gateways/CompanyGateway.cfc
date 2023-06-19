<cfcomponent name="CompanyGateway" accessors="true" output="false">

    <cffunction name="getAllCompanies">
  
        <cfquery name="companyQuery" datasource="contentManager">
            SELECT 
              intCompanyKey,
              vcCompanyName,
              CASE 
                WHEN 
                  bitIsActive = 1 THEN 'Yes'
                ELSE 
                  'No'
              END AS 
              bitIsActive
            FROM 
              tblCompany;
          </cfquery>
          <cfreturn companyQuery>
    </cffunction>

    <cffunction name="getOneCompany">
      <cfargument name="intCompanyKey" required="true">
    
      <cfquery name="getOneCompanyQuery" datasource="contentManager">
          SELECT
            intCompanyKey, 
            vcCompanyName, 
            CASE 
              WHEN 
                bitIsActive = 1 THEN 'Yes'
              ELSE 
                'No'
            END AS 
            bitIsActive
          FROM 
            tblCompany
          WHERE 
            intCompanyKey = <cfqueryparam value="#arguments.intCompanyKey#" cfsqltype="cf_sql_integer">;
      </cfquery>
      <cfreturn getOneCompanyQuery>
    
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
                <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.Company.getBitIsActive()#">
            )
        </cfquery>   
    </cffunction>


    <cffunction name="update">
      <cfargument name="Company" required="true">
    
        <cfquery name="updateCompanyQuery" datasource="contentManager">
    
          UPDATE 
            tblCompany 
          SET 
            vcCompanyName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Company.getVcCompanyName()#">,
            bitIsActive = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.Company.getBitIsActive()#">
          WHERE 
            intCompanyKey = <cfqueryparam value="#arguments.Company.getIntCompanyKey()#" cfsqltype="cf_sql_integer">;
        </cfquery>
        
    </cffunction>


    <cffunction name="delete">
      <cfargument name="Company" required="true">
    
        <cfquery name="deleteCompanyQuery" datasource="contentManager">
    
          DELETE FROM 
            tblCompany 
          WHERE 
            intCompanyKey = <cfqueryparam value="#arguments.Company.getIntCompanyKey()#" cfsqltype="cf_sql_integer">;
        </cfquery>
        
    </cffunction>
  
    
  </cfcomponent>