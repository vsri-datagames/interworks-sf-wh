select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select processing_status
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where processing_status is null



      
    ) dbt_internal_test