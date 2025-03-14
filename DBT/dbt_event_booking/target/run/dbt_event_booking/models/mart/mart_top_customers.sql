
  
    

        create or replace transient table EVENT_BOOKING.mart.mart_top_customers
         as
        (SELECT
    DISTINCT customer_id,
    customer_name,
    total_transactions,
    total_revenue,
    top_customers,
    country
FROM
    EVENT_BOOKING.intermediate.int_rank_customers_on_revenue
    INNER JOIN
    EVENT_BOOKING.intermediate.int_countries
    USING (customer_id)
        );
      
  