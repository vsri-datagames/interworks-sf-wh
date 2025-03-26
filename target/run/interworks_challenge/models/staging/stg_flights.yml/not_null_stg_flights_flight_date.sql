select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select flight_date
from RECRUITMENT_DB.CANDIDATE_00183.stg_flights
where flight_date is null



      
    ) dbt_internal_test