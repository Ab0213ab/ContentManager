<cfcomponent name="EmployeeGateway" accessors="true" output="false">

  <cffunction name="getAllEmployees">

      <cfquery name="employeeQuery" datasource="contentManager">
          SELECT * 
          FROM tblEmployee;
        </cfquery>
        <cfreturn employeeQuery>

  </cffunction>


  <cffunction name="getAllEmployeesFirstNames">

    <cfquery name="employeesFirstNameQuery" datasource="contentManager">
        SELECT vcFirstName 
        FROM tblEmployee;
      </cfquery>
      <cfreturn employeesFirstNameQuery>

</cffunction>


  <cffunction name="getOneEmployee">
    <cfargument name="intEmployeeID" required="true">
  
    <cfquery name="getOneEmployeeQuery" datasource="contentManager">
        SELECT * 
        FROM tblEmployee
        WHERE intEmployeeID = <cfqueryparam value="#arguments.intEmployeeID#" cfsqltype="cf_sql_integer">;
    </cfquery>
    <cfreturn getOneEmployeeQuery>

  </cffunction>


  <cffunction name="create">
    <cfargument name="Employee" required="true">

    <cfquery name="addNewEmployeeQuery" datasource="contentManager">

      INSERT INTO tblEmployee 
        (
            vcLastName, vcFirstName, vcTitle, vcTitleOfCourtesy, dtBirthDate, dtHireDate, vcAddress, vcCity, vcRegion, vcPostalCode,
            vcCountry, vcHomePhone, vcExtension, vcNotes, intCompanyKey
        )
        VALUES ( 
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcLastName()#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcFirstName()#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcTitle()#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcTitleOfCourtesy()#">,
            <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.Employee.getDtBirthDate()#">,
            <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.Employee.getDtHireDate()#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcAddress()#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcCity()#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcRegion()#">,
            <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.Employee.getVcPostalCode()#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcCountry()#">,
            <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.Employee.getVcHomePhone()#">,
            <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.Employee.getVcExtension()#">,
            <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcNotes()#">,
            <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.Employee.getIntCompanyKey()#">
        )
    </cfquery>
    
</cffunction>


<cffunction name="update">
  <cfargument name="Employee" required="true">

    <cfquery name="updateEmployeeQuery" datasource="contentManager">

      UPDATE tblEmployee 
      SET vcLastName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcLastName()#">,
          vcFirstName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcFirstName()#">,
          vcTitle = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcTitle()#">,
          vcTitleOfCourtesy = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcTitleOfCourtesy()#">,
          dtBirthDate = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.Employee.getDtBirthDate()#">,
          dtHireDate = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.Employee.getDtHireDate()#">,
          vcAddress = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcAddress()#">,
          vcCity = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcCity()#">,
          vcRegion = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcRegion()#">,
          vcPostalCode = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.Employee.getVcPostalCode()#">,
          vcCountry = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcCountry()#">,
          vcHomePhone = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcHomePhone()#">,
          vcExtension = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.Employee.getVcExtension()#">,
          vcNotes = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.Employee.getVcNotes()#">,
          intCompanyKey = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.Employee.getIntCompanyKey()#">
      WHERE intEmployeeID = <cfqueryparam value="#arguments.Employee.getIntEmployeeID()#" cfsqltype="cf_sql_integer">;
    </cfquery>
    
</cffunction>


<cffunction name="delete">
  <cfargument name="Employee" required="true">

    <cfquery name="deleteEmployeeQuery" datasource="contentManager">

      DELETE FROM tblEmployee 
      WHERE intEmployeeID = <cfqueryparam value="#arguments.Employee.getIntEmployeeID()#" cfsqltype="cf_sql_integer">;
    </cfquery>
    
</cffunction>


</cfcomponent>