
    
    

with all_values as (

    select
        DEPDELAYGT15 as value_field,
        count(*) as n_records

    from RECRUITMENT_DB.CANDIDATE_00183.fact_flights
    group by DEPDELAYGT15

)

select *
from all_values
where value_field not in (
    '0','1'
)


