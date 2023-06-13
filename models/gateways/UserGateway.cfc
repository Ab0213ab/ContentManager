<cfcomponent name="UserGateway" accessors="true" output="false">

  <cffunction name="getAllUsers">
  
    <cfquery name="UserQuery" datasource="contentManager">
        SELECT 
            vcUserName,
            vcPassword,
            CASE 
                WHEN 
                  bitIsActive = 1 THEN 'Yes'
                ELSE 
                  'No'
            END AS 
              bitIsActive,
            CASE 
                WHEN 
                  bitIsAdmin = 1 THEN 'Yes'
                ELSE 
                  'No'
            END AS 
              bitIsAdmin,
            intUserID 
        FROM 
            tblUser;
      </cfquery>
      <cfreturn UserQuery>
  
  </cffunction>


  <cffunction name="getOneUser">
      <cfargument name="intUserID" required="true">
    
      <cfquery name="getOneUserQuery" datasource="contentManager">
          SELECT 
            vcUserName,
            vcPassword, 
            CASE 
              WHEN 
                bitIsActive = 1 THEN 'Yes'
              ELSE 
                'No'
          END AS 
            bitIsActive,
          CASE 
              WHEN 
                bitIsAdmin = 1 THEN 'Yes'
              ELSE 
                'No'
          END AS 
            bitIsAdmin,
            intUserID 
          FROM 
            tblUser
          WHERE 
            intUserID = <cfqueryparam value="#arguments.intUserID#" cfsqltype="cf_sql_integer">;
      </cfquery>
      <cfreturn getOneUserQuery>
    
  </cffunction>


  <cffunction name="create">
      <cfargument name="User" required="true">
  
      <cfquery name="addNewUserQuery" datasource="contentManager">
  
        INSERT INTO 
          tblUser 
          (
              vcUserName,
              vcPassword, 
              bitIsActive,
              bitIsAdmin
          )
          VALUES ( 
              <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.User.getVcUserName()#">,
              <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.User.getVcPassword()#">,
              <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.User.getBitIsActive()#">,
              <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.User.getBitIsAdmin()#">
          )
      </cfquery>   
  </cffunction>


  <cffunction name="update">
    <cfargument name="User" required="true">
  
      <cfquery name="updateUserQuery" datasource="contentManager">
  
        UPDATE 
          tblUser 
        SET 
          vcUserName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.User.getVcUserName()#">,
          vcPassword = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.User.getVcPassword()#">,
          bitIsActive = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.User.getBitIsActive()#">,
          bitIsAdmin = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.User.getBitIsAdmin()#">
        WHERE 
          intUserID = <cfqueryparam value="#arguments.User.getIntUserID()#" cfsqltype="cf_sql_integer">;
      </cfquery>
      
  </cffunction>

  <cffunction name="delete">
    <cfargument name="User" required="true">
  
      <cfquery name="deleteUserQuery" datasource="contentManager">
  
        DELETE FROM 
          tblUser 
        WHERE 
          intUserID = <cfqueryparam value="#arguments.User.getIntUserID()#" cfsqltype="cf_sql_integer">;
      </cfquery>
      
  </cffunction>
    
  </cfcomponent>