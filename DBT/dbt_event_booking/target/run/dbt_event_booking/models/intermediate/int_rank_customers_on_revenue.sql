
  
    

        create or replace transient table EVENT_BOOKING.intermediate.int_rank_customers_on_revenue
         as
        (WITH joined_customers_with_transactions_cte AS (
    select 
        customer_id,
        customer_name,
        revenue,
        revenue_type
    from
        EVENT_BOOKING.staging.stg_transactions 
        inner join
        EVENT_BOOKING.staging.stg_customers 
        using (customer_id)
)
SELECT
    customer_id,
    customer_name,
    count(revenue) as total_transactions,
    ROUND(sum(revenue),2) as total_revenue,
    rank() over(order by sum(revenue) desc) as top_customers
from
    joined_customers_with_transactions_cte
WHERE
    revenue_type = 1
group by 
    customer_id, customer_name
order by
    total_revenue desc
        );
      
  