select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        NEXTDAYARR as value_field,
        count(*) as n_records

    from RECRUITMENT_DB.CANDIDATE_00183.fact_flights
    group by NEXTDAYARR

)

select *
from all_values
where value_field not in (
    '0','1'
)



      
    ) dbt_internal_test