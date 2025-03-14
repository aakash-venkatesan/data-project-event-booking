select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    total_quantity as unique_field,
    count(*) as n_records

from dbt.dbt_orders.orders
where total_quantity is not null
group by total_quantity
having count(*) > 1



      
    ) dbt_internal_test