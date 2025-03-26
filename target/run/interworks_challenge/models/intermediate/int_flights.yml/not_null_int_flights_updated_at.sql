select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select updated_at
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where updated_at is null



      
    ) dbt_internal_test