WITH new_customers_cte AS (
    SELECT 
        CUSTOMER_ID,
        DATE_TRUNC('year', MIN(PAYMENT_MONTH)) AS fiscal_year
    FROM 
        {{ ref('stg_transactions') }}
    GROUP BY 
        CUSTOMER_ID
)
SELECT 
    fiscal_year,
    COUNT(CUSTOMER_ID) AS new_customers
FROM 
    new_customers_cte
GROUP BY 
    fiscal_year
ORDER BY 
    fiscal_year