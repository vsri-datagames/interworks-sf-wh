select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select WHEELSOFF
from RECRUITMENT_DB.CANDIDATE_00183.fact_flights
where WHEELSOFF is null



      
    ) dbt_internal_test