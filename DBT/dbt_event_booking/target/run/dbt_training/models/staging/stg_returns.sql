
  
    

        create or replace transient table RETAIL_DB.staging.stg_returns
         as
        (SELECT 
    order_id,
    SUM(quantity) AS returned_quantity
FROM 
    RETAIL_DB.STAGING.RETURNS
GROUP BY 
    order_id
        );
      
  