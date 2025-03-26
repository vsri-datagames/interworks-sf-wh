select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select airport_code
from RECRUITMENT_DB.CANDIDATE_00183.int_airport
where airport_code is null



      
    ) dbt_internal_test