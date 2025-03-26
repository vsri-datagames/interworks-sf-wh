select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    AIRLINECODE as unique_field,
    count(*) as n_records

from RECRUITMENT_DB.CANDIDATE_00183.dim_airline
where AIRLINECODE is not null
group by AIRLINECODE
having count(*) > 1



      
    ) dbt_internal_test