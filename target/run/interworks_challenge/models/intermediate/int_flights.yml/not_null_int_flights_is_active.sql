select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select is_active
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where is_active is null



      
    ) dbt_internal_test