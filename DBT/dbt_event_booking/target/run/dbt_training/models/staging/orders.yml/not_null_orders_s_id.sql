select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select s_id
from dbt.dbt_orders.orders
where s_id is null



      
    ) dbt_internal_test