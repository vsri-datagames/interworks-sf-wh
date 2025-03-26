select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select crs_arr_time
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where crs_arr_time is null



      
    ) dbt_internal_test