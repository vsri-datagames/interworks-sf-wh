select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ORIGSTATENAME
from RECRUITMENT_DB.CANDIDATE_00183.vw_flights
where ORIGSTATENAME is null



      
    ) dbt_internal_test