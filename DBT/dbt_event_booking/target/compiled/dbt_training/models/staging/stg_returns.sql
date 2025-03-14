SELECT 
    order_id,
    SUM(quantity) AS returned_quantity
FROM 
    RETAIL_DB.STAGING.RETURNS
GROUP BY 
    order_id