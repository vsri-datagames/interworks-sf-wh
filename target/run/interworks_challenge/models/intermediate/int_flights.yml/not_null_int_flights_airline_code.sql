select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select airline_code
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where airline_code is null



      
    ) dbt_internal_test