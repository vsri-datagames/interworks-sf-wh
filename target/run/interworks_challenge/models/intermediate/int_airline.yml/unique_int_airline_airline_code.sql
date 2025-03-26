select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    airline_code as unique_field,
    count(*) as n_records

from RECRUITMENT_DB.CANDIDATE_00183.int_airline
where airline_code is not null
group by airline_code
having count(*) > 1



      
    ) dbt_internal_test