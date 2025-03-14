
  
    

        create or replace transient table RETAIL_DB.mart.store_performance_report
         as
        (WITH store_sales_data AS (
    SELECT
        s.store_id,          
        s.store_name,
        s.location,
        s.store_type,
        COUNT(DISTINCT e.employee_id) AS total_employees, 
        COUNT(DISTINCT o.order_id) AS total_orders,       
        SUM(oli.total_units_sold) AS total_units_sold,    
        SUM(o.total_amount) AS total_sales_amount,         
        AVG(o.total_amount) AS average_order_value         
    FROM
        RETAIL_DB.staging.stg_stores AS s 
    LEFT JOIN RETAIL_DB.staging.stg_orders AS o  
        ON s.store_id = o.store_id
    LEFT JOIN RETAIL_DB.staging.stg_order_line_items AS oli  
        ON o.order_id = oli.order_id
    LEFT JOIN RETAIL_DB.staging.stg_employees AS e  
        ON s.store_id = e.store_id
    GROUP BY
        s.store_id, s.store_name, s.location, s.store_type
),
returned_orders AS (
    SELECT
        o.store_id,  
        COALESCE(SUM(r.returned_quantity), 0) AS returned_quantity 
    FROM
        RETAIL_DB.staging.stg_orders AS o 
    LEFT JOIN RETAIL_DB.staging.stg_returns AS r  
        ON o.order_id = r.order_id
    GROUP BY
        o.store_id  
)
SELECT
    ss.store_id,        
    ss.store_name,
    ss.location,
    ss.total_employees,
    ss.total_units_sold,
    ss.total_orders,
    COALESCE(ro.returned_quantity, 0) AS returned_order_count,  
    ss.total_sales_amount,
    ss.average_order_value,
    ss.store_type
FROM
    store_sales_data AS ss 
LEFT JOIN returned_orders AS ro  
    ON ss.store_id = ro.store_id
        );
      
  