
  
    

        create or replace transient table EVENT_BOOKING.mart.mart_nrr_grr
         as
        (SELECT
    *
FROM
    EVENT_BOOKING.intermediate.int_nrr_grr
        );
      
  