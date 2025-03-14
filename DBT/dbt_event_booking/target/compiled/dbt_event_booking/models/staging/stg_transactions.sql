-- This model is a staging model that is used to remove null values from the transactions table
-- This cte is used to remove null values from the transactions table
WITH remove_null_values_in_transaction_cte AS (
    SELECT
        customer_id,
        product_id,
        payment_month,
        revenue_type,
        revenue,
        quantity,
        companies,
        dimension_1,
        dimension_2,
        dimension_3,
        dimension_4,
        dimension_5,
        dimension_6,
        dimension_7,
        dimension_8,
        dimension_9,
        dimension_10
    FROM
        EVENT_BOOKING.RAW.TRANSACTIONS
    WHERE 
        customer_id IS NOT NULL
        AND product_id IS NOT NULL
),
remove_duplicates_in_transaction_cte AS (
    SELECT
        DISTINCT *
    FROM
        remove_null_values_in_transaction_cte
),
-- this cte is used to cast the columns to the correct data types
cast_columns_in_transaction_cte AS (
    SELECT 
        TRIM(CAST(customer_id AS INT)) AS customer_id,
        TRIM(product_id) AS product_id,
        TO_DATE(payment_month, 'MM/DD/YYYY') AS payment_month,
        TRIM(CAST(quantity AS INT)) AS quantity,
        TRIM(CAST(revenue AS FLOAT)) AS revenue,
        TRIM(CAST(revenue_type AS INT)) AS revenue_type,
        TRIM(companies) AS companies,
        TRIM(dimension_1) AS dimension_1,
        TRIM(dimension_2) AS dimension_2,
        TRIM(dimension_3) AS dimension_3,
        TRIM(dimension_4) AS dimension_4,
        TRIM(dimension_5) AS dimension_5,
        TRIM(dimension_6) AS dimension_6,
        TRIM(dimension_7) AS dimension_7,
        TRIM(dimension_8) AS dimension_8,
        TRIM(dimension_9) AS dimension_9,
        TRIM(dimension_10) AS dimension_10
    FROM    
        remove_duplicates_in_transaction_cte
)
SELECT  
    *
FROM 
    cast_columns_in_transaction_cte