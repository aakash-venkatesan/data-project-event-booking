SELECT 
    *
FROM 
    {{ ref('int_customer_cross_sell') }}
WHERE
    current_cross_sell > 0