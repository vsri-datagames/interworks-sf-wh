select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select DESTAIRPORTCODE as from_field
    from RECRUITMENT_DB.CANDIDATE_00183.fact_flights
    where DESTAIRPORTCODE is not null
),

parent as (
    select AIRPORTCODE as to_field
    from RECRUITMENT_DB.CANDIDATE_00183.dim_airport
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test