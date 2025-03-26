select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select AIRPORTCODE
from RECRUITMENT_DB.CANDIDATE_00183.dim_airport
where AIRPORTCODE is null



      
    ) dbt_internal_test