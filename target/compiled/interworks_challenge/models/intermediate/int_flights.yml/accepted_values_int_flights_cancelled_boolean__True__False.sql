
    
    

with all_values as (

    select
        cancelled_boolean as value_field,
        count(*) as n_records

    from RECRUITMENT_DB.CANDIDATE_00183.int_flights
    group by cancelled_boolean

)

select *
from all_values
where value_field not in (
    'True','False'
)


