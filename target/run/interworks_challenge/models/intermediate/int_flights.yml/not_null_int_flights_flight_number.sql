select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select flight_number
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where flight_number is null



      
    ) dbt_internal_test