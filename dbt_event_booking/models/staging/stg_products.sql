-- This model a staging model that is used to remove null values from the products table
WITH remove_null_values_in_product_cte AS (
    SELECT
        DISTINCT *
    FROM
        {{source('event_booking', 'PRODUCTS')}}
    WHERE 
        product_id IS NOT NULL
),
trim_values_in_product_cte AS (
    SELECT 
        TRIM(product_id) AS product_id,  -- Casting the product_id as INT
        TRIM(product_family) AS product_family,
        TRIM(product_sub_family) AS product_sub_family
    FROM
        remove_null_values_in_product_cte
)
SELECT 
    *
FROM
    trim_values_in_product_cte