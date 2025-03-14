
  
    

        create or replace transient table RETAIL_DB.staging.stg_la_orders
         as
        (SELECT  
    order_id,
    customer_id,
    store_id,
    discount,
    tax_amount,
    total_amount,
    order_date
FROM
    RETAIL_DB.STAGING.ORDERS
        );
      
  