select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select origin_airport_code
from RECRUITMENT_DB.CANDIDATE_00183.stg_flights
where origin_airport_code is null



      
    ) dbt_internal_test