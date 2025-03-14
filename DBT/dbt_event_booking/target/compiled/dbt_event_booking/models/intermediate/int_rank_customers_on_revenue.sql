WITH joined_customers_with_transactions_cte AS (
    SELECT 
        customer_id,
        customer_name,
        revenue,
        revenue_type
    FROM
        EVENT_BOOKING.staging.stg_transactions 
        INNER JOIN
        EVENT_BOOKING.staging.stg_customers 
        USING (customer_id)
)
SELECT
    customer_id,
    customer_name,
    COUNT(revenue) AS total_transactions,
    ROUND(sum(revenue),2) AS total_revenue,
    DENSE_RANK() OVER(ORDER BY SUM(revenue) DESC) AS top_customers
FROM
    joined_customers_with_transactions_cte
WHERE
    revenue_type = 1
GROUP BY
    customer_id, customer_name
ORDER BY
    total_revenue DESC