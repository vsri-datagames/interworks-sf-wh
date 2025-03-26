select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select city_name
from RECRUITMENT_DB.CANDIDATE_00183.int_airport
where city_name is null



      
    ) dbt_internal_test