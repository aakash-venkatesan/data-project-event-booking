
  
    

        create or replace transient table RETAIL_DB.staging.stg_la_returns
         as
        (SELECT
    return_id, 
    order_id,
    product_id,
    return_date,
    quantity,
    refund_amount
FROM
    RETAIL_DB.STAGING.RETURNS
        );
      
  