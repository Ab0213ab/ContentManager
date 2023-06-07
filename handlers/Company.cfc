component extends="coldbox.system.EventHandler" {

    property name="EmployeeService" inject="model:EmployeeService";
    property name="EmployeeGateway" inject="model:EmployeeGateway";
    property name="CompanyService" inject="model:CompanyService";
    property name="CompanyGateway" inject="model:CompanyGateway";

    function index() {

    }
  
}