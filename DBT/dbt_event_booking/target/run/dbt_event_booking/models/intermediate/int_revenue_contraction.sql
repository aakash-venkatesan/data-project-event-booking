
  
    

        create or replace transient table EVENT_BOOKING.intermediate.int_revenue_contraction
         as
        (WITH revenue_data AS (
    SELECT
        customer_id,
        revenue,
        payment_month AS date,
        EXTRACT(YEAR FROM payment_month) AS year,
        EXTRACT(MONTH FROM payment_month) AS month
    FROM
        EVENT_BOOKING.staging.stg_transactions
),
contraction_data AS (
    SELECT
        customer_id,
        LAG(revenue) OVER (PARTITION BY customer_id ORDER BY date) AS previous_revenue,
        revenue,
        date,
        year,
        month
    FROM
        revenue_data
)
SELECT
    customer_id,
    customer_name,
    year,
    month,
    MAX(previous_revenue) AS previous_revenue,
    MAX(revenue) AS revenue,
    SUM(CASE
        WHEN previous_revenue > revenue THEN ROUND(previous_revenue - revenue,2)        
        WHEN previous_revenue = revenue THEN 0
        ELSE 0
    END) AS revenue_lost
FROM
    contraction_data
    INNER JOIN
    EVENT_BOOKING.staging.stg_customers
    USING (customer_id)
GROUP BY
    customer_id,
    customer_name,
    month,
    year
ORDER BY
    customer_id,
    year,
    month
        );
      
  