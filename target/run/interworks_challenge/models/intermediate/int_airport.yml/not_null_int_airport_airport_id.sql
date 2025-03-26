select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select airport_id
from RECRUITMENT_DB.CANDIDATE_00183.int_airport
where airport_id is null



      
    ) dbt_internal_test