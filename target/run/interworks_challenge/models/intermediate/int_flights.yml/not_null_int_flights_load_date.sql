select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select load_date
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where load_date is null



      
    ) dbt_internal_test