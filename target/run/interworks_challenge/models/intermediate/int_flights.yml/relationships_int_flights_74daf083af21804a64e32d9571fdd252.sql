select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select airline_code as from_field
    from RECRUITMENT_DB.CANDIDATE_00183.int_flights
    where airline_code is not null
),

parent as (
    select airline_code as to_field
    from RECRUITMENT_DB.CANDIDATE_00183.int_airline
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test