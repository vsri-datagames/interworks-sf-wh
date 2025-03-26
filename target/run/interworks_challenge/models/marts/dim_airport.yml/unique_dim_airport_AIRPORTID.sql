select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    AIRPORTID as unique_field,
    count(*) as n_records

from RECRUITMENT_DB.CANDIDATE_00183.dim_airport
where AIRPORTID is not null
group by AIRPORTID
having count(*) > 1



      
    ) dbt_internal_test