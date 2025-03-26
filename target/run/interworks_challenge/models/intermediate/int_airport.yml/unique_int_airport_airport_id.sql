select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    airport_id as unique_field,
    count(*) as n_records

from RECRUITMENT_DB.CANDIDATE_00183.int_airport
where airport_id is not null
group by airport_id
having count(*) > 1



      
    ) dbt_internal_test