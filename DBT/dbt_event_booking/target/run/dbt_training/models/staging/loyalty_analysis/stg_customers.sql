
  
    

        create or replace transient table RETAIL_DB.staging.stg_customers
         as
        (SELECT 
    customer_id,
    first_name,
    last_name,
    gender,
    email,
    date_of_birth,
    registration_date,
    membership_level
FROM
    RETAIL_DB.STAGING.CUSTOMERS
        );
      
  