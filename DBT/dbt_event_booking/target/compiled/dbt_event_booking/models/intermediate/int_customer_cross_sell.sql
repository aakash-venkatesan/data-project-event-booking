WITH product_counts AS (
    SELECT 
        CUSTOMER_ID,
        COUNT(DISTINCT PRODUCT_ID) AS total_products,
        COUNT(DISTINCT CASE WHEN PAYMENT_MONTH < DATEADD(month, -3, '2020-06-01') THEN PRODUCT_ID END) AS churned_products
    FROM 
        EVENT_BOOKING.staging.stg_transactions
    GROUP BY 
        CUSTOMER_ID
)
SELECT 
    CUSTOMER_ID,
    customer_name,
    total_products,
    churned_products,
    (total_products - churned_products) AS current_cross_sell,
    DENSE_RANK() OVER (ORDER BY (total_products - churned_products) DESC) AS customer_rank
FROM 
    product_counts
    INNER JOIN
    EVENT_BOOKING.staging.stg_customers
    USING (CUSTOMER_ID)
ORDER BY 
    current_cross_sell DESC