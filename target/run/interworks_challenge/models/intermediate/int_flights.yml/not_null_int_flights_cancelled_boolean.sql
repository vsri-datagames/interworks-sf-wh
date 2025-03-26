select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select cancelled_boolean
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where cancelled_boolean is null



      
    ) dbt_internal_test