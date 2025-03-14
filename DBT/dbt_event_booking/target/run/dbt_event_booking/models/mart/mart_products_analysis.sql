
  
    

        create or replace transient table EVENT_BOOKING.mart.mart_products_analysis
         as
        (SELECT
    *
FROM
    EVENT_BOOKING.intermediate.int_rank_products_on_revenue
        );
      
  