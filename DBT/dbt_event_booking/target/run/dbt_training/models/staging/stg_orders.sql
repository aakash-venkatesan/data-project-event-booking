
  
    

        create or replace transient table RETAIL_DB.staging.stg_orders
         as
        (SELECT 
    order_id,
    store_id,
    total_amount
FROM RETAIL_DB.STAGING.ORDERS
        );
      
  