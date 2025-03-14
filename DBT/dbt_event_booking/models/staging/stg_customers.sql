-- This model a staging model that is used to remove null values from the customers table
WITH remove_null_values_in_customer_cte AS (
    SELECT
        *
    FROM
        {{source('event_booking', 'CUSTOMERS')}}
    WHERE 
        customer_id IS NOT NULL
),
-- This CTE is used to remove duplicates from the customers table
remove_duplicates_in_customer_cte AS (
    SELECT
        DISTINCT *
    FROM
        remove_null_values_in_customer_cte
)
SELECT 
    TRIM(CAST(customer_id AS INT)) AS customer_id,  -- Casting the customer_id as INT
    TRIM(customername) AS customer_name,
    TRIM(company) AS company
FROM    
    remove_duplicates_in_customer_cte