select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ORIGSTATECODE
from RECRUITMENT_DB.CANDIDATE_00183.vw_flights
where ORIGSTATECODE is null



      
    ) dbt_internal_test