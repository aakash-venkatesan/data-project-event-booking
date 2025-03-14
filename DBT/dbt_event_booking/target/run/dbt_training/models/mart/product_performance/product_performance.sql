
  
    

        create or replace transient table RETAIL_DB.mart.product_performance
         as
        (WITH order_details AS (
    SELECT
        o.order_id,
        o.customer_id,
        o.store_id,
        o.order_date,
        o.order_time,
        o.total_amount,
        o.discount,
        o.tax_amount,
        o.payment_method,
        o.shipping_address,
        o.billing_address,
        o.order_status,
        o.shipping_method,
        o.delivery_date,
        oli.product_id,  -- Fetch the product_id from order_line_items
        oli.quantity,
        oli.unit_price
    FROM 
        RETAIL_DB.staging.stg_pp_orders AS o  -- Reference to the stg_orders model
    LEFT JOIN RETAIL_DB.staging.stg_pp_order_line_items AS oli  -- Reference to the stg_order_line_items model
        ON o.order_id = oli.order_id  -- Join with order_line_items to get the product_id
)
SELECT 
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
    delivery_date,
    product_id,    
    quantity,      
    unit_price
FROM 
    order_details
        );
      
  