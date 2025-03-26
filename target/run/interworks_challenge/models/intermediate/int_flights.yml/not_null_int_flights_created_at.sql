select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select created_at
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where created_at is null



      
    ) dbt_internal_test