
  
    

        create or replace transient table RETAIL_DB.staging.stg_pp_stores
         as
        (SELECT
    store_id,
    store_name,
    location,
    address,
    city,
    state,
    postal_code,
    country,
    manager_name,
    opening_date,
    store_type
FROM
    RETAIL_DB.STAGING.STORES
        );
      
  