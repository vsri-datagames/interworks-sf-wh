
    
    

with child as (
    select dest_airport_code as from_field
    from RECRUITMENT_DB.CANDIDATE_00183.int_flights
    where dest_airport_code is not null
),

parent as (
    select airport_code as to_field
    from RECRUITMENT_DB.CANDIDATE_00183.int_airport
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


