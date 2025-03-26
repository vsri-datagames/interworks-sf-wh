
    
    

select
    TRANSACTIONID as unique_field,
    count(*) as n_records

from RECRUITMENT_DB.CANDIDATE_00183.fact_flights
where TRANSACTIONID is not null
group by TRANSACTIONID
having count(*) > 1


