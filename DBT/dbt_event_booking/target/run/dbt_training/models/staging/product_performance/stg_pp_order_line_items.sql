
  
    

        create or replace transient table RETAIL_DB.staging.stg_pp_order_line_items
         as
        (SELECT
    line_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    discount,
    subtotal,
    tax_amount,
    total_price
FROM 
    RETAIL_DB.STAGING.ORDER_LINE_ITEMS
        );
      
  