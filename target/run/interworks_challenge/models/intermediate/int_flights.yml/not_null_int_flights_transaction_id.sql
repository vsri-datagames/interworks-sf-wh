select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select transaction_id
from RECRUITMENT_DB.CANDIDATE_00183.int_flights
where transaction_id is null



      
    ) dbt_internal_test