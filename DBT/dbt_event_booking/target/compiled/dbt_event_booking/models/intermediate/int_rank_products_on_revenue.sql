WITH rank_products_cte AS (
    SELECT 
        product_id,
        product_family,
        COUNT(revenue) AS total_transactions,
        ROUND(SUM(revenue), 2) AS total_revenue,
        DENSE_RANK() OVER (ORDER BY SUM(revenue) DESC) AS product_rank
    FROM 
        EVENT_BOOKING.staging.stg_transactions
        INNER JOIN
        EVENT_BOOKING.staging.stg_products
        USING (product_id)
    GROUP BY 
        product_id, product_family
    ORDER BY 
        total_revenue DESC
)
SELECT 
    *
FROM    
    rank_products_cte