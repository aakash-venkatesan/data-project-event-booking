WITH customer_status AS (
    SELECT 
        CUSTOMER_ID,
        MIN(PAYMENT_MONTH) AS first_purchase_date,
        MAX(PAYMENT_MONTH) AS last_purchase_date,
        rank
    FROM 
        {{ ref('stg_transactions') }}
    GROUP BY 
        CUSTOMER_ID
)
SELECT 
    DATE_TRUNC('month', first_purchase_date) AS month,
    COUNT(CASE 
            WHEN last_purchase_date < DATEADD(month, -12, '2020-06-01') 
            THEN CUSTOMER_ID 
          END) AS churned_customers,
    COUNT(CASE 
            WHEN first_purchase_date >= DATEADD(month, -12, '2020-06-01') 
            THEN CUSTOMER_ID 
          END) AS new_customers
FROM 
    customer_status
GROUP BY 
    month
ORDER BY 
    month