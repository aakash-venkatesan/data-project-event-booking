-- CTE to remove null values in countries
WITH remove_null_values_in_countries_cte AS (
    SELECT
        customer_id,
        country,
        region
    FROM
        {{ source('event_booking', 'COUNTRIES')}}
    WHERE 
        customer_id IS NOT NULL
),
distinct_values_in_countries_cte AS (
    SELECT
        DISTINCT *
    FROM
        remove_null_values_in_countries_cte
)
SELECT 
    TRIM(CAST(customer_id AS INT)) AS customer_id,  -- Casting the customer_id as INT
    TRIM(country) AS country,
    TRIM(region) AS region
FROM  
    distinct_values_in_countries_cte