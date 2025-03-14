
  
    

        create or replace transient table RETAIL_DB.staging.stg_stores
         as
        (SELECT 
    store_id,
    store_name,
    location,
    store_type
FROM 
    RETAIL_DB.STAGING.STORES
        );
      
  