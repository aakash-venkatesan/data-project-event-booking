
  
    

        create or replace transient table EVENT_BOOKING.mart.mart_revenue_contraction
         as
        (SELECT
    *
FROM
    EVENT_BOOKING.intermediate.int_revenue_contraction
        );
      
  