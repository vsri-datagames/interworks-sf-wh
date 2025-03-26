
    
    

select
    airline_name as unique_field,
    count(*) as n_records

from RECRUITMENT_DB.CANDIDATE_00183.int_airline
where airline_name is not null
group by airline_name
having count(*) > 1


