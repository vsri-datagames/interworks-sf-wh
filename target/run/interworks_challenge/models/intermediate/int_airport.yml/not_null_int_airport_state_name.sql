select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select state_name
from RECRUITMENT_DB.CANDIDATE_00183.int_airport
where state_name is null



      
    ) dbt_internal_test