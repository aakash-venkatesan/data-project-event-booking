
  
    

        create or replace transient table EVENT_BOOKING.intermediate.int_product_churn
         as
        (WITH purchase_history AS (
    SELECT
        customer_id,
        product_id,
        MAX(payment_month) AS last_purchase_month
    FROM 
        EVENT_BOOKING.staging.stg_transactions
    GROUP BY 
        customer_id, 
        product_id
),
churned_products AS (
    SELECT
        customer_id,
        product_id,
        last_purchase_month
    FROM 
        purchase_history ph
    WHERE 
        last_purchase_month < DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '12 months'
)
SELECT
    customer_id,
    COUNT(DISTINCT product_id) AS churned_products
FROM 
    churned_products
GROUP BY 
    customer_id
ORDER BY 
    churned_products DESC
        );
      
  