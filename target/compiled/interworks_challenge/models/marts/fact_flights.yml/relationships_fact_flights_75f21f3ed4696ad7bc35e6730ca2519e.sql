
    
    

with child as (
    select AIRLINECODE as from_field
    from RECRUITMENT_DB.CANDIDATE_00183.fact_flights
    where AIRLINECODE is not null
),

parent as (
    select AIRLINECODE as to_field
    from RECRUITMENT_DB.CANDIDATE_00183.dim_airline
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


