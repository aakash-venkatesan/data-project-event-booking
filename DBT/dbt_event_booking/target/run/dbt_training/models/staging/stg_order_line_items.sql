
  
    

        create or replace transient table RETAIL_DB.staging.stg_order_line_items
         as
        (SELECT 
    o.store_id,  
    oli.order_id,
    SUM(oli.quantity) AS total_units_sold
FROM 
    RETAIL_DB.STAGING.ORDER_LINE_ITEMS AS oli  
    JOIN 
        RETAIL_DB.STAGING.ORDERS AS o 
    ON 
        oli.order_id = o.order_id
GROUP BY 
    o.store_id, 
    oli.order_id
        );
      
  