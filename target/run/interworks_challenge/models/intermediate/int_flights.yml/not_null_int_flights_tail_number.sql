select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select tail_number
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where tail_number is null



      
    ) dbt_internal_test