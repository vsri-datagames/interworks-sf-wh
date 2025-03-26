select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select DESTAIRPORTNAME
from RECRUITMENT_DB.CANDIDATE_00183.vw_flights
where DESTAIRPORTNAME is null



      
    ) dbt_internal_test