
    
    

select
    AIRLINECODE as unique_field,
    count(*) as n_records

from RECRUITMENT_DB.CANDIDATE_00183.dim_airline
where AIRLINECODE is not null
group by AIRLINECODE
having count(*) > 1


