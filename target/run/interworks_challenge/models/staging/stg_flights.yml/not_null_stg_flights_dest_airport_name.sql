select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select dest_airport_name
from RECRUITMENT_DB.CANDIDATE_00183.stg_flights
where dest_airport_name is null



      
    ) dbt_internal_test