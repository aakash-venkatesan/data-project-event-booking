
    
    

select
    s_id as unique_field,
    count(*) as n_records

from dbt.dbt_orders.orders
where s_id is not null
group by s_id
having count(*) > 1


