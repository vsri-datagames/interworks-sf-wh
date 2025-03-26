
    
    

with all_values as (

    select
        DIVERTED as value_field,
        count(*) as n_records

    from RECRUITMENT_DB.CANDIDATE_00183.fact_flights
    group by DIVERTED

)

select *
from all_values
where value_field not in (
    'True','False'
)


