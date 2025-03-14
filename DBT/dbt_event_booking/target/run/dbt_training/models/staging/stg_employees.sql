
  
    

        create or replace transient table RETAIL_DB.staging.stg_employees
         as
        (SELECT 
    store_id,
    employee_id
FROM
    RETAIL_DB.STAGING.EMPLOYEES
        );
      
  