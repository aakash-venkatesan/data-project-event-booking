
  
    

        create or replace transient table RETAIL_DB.staging.stg_pp_orders
         as
        (SELECT 
    order_id,
    customer_id,
    store_id,
    order_date,
    order_time,
    total_amount,
    discount,
    tax_amount,
    payment_method,
    shipping_address,
    billing_address,
    order_status,
    shipping_method,
    delivery_date
FROM 
    RETAIL_DB.STAGING.ORDERS
        );
      
  