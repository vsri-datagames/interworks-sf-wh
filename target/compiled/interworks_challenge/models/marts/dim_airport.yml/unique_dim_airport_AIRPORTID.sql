
    
    

select
    AIRPORTID as unique_field,
    count(*) as n_records

from RECRUITMENT_DB.CANDIDATE_00183.dim_airport
where AIRPORTID is not null
group by AIRPORTID
having count(*) > 1


