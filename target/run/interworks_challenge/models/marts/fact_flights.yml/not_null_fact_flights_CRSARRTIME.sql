select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select CRSARRTIME
from RECRUITMENT_DB.CANDIDATE_00183.fact_flights
where CRSARRTIME is null



      
    ) dbt_internal_test