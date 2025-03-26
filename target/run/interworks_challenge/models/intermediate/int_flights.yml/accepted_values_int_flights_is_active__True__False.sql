select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        is_active as value_field,
        count(*) as n_records

    from RECRUITMENT_DB.CANDIDATE_00183.int_flights
    group by is_active

)

select *
from all_values
where value_field not in (
    'True','False'
)



      
    ) dbt_internal_test