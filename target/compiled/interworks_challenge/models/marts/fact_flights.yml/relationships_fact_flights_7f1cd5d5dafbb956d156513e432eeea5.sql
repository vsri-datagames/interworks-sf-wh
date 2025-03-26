
    
    

with child as (
    select ORIGINAIRPORTCODE as from_field
    from RECRUITMENT_DB.CANDIDATE_00183.fact_flights
    where ORIGINAIRPORTCODE is not null
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


