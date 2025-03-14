select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    s_id as unique_field,
    count(*) as n_records

from dbt.dbt_orders.orders
where s_id is not null
group by s_id
having count(*) > 1



      
    ) dbt_internal_test