
  
    

        create or replace transient table EVENT_BOOKING.intermediate.int_consolidated_tables
         as
        (SELECT  
    DISTINCT *
FROM
    EVENT_BOOKING.staging.stg_customers
    inner join
    EVENT_BOOKING.staging.stg_countries
    using (customer_id)
    inner join
    EVENT_BOOKING.staging.stg_transactions
    using (customer_id)    
    inner join
    EVENT_BOOKING.staging.stg_products
    using (product_id)
        );
      
  