<cfcomponent name="UserGateway" accessors="true" output="false">

    <cffunction name="getAllUsers">
  
        <cfquery name="UserQuery" datasource="contentManager">
            SELECT 
                vcUserName,
                vcPassword,
                bitIsActive,
                bitIsAdmin 
            FROM 
                tblUser;
          </cfquery>
          <cfreturn UserQuery>
  
    </cffunction>
    
  </cfcomponent>