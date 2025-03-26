
  
    

        create or replace transient table RECRUITMENT_DB.CANDIDATE_00183.dim_airline
         as
        (WITH mart_airline AS (
    SELECT 
        airline_code as AIRLINECODE,
        SPLIT_PART(airline_name, ':', 1) AS AIRLINENAME
    FROM int_airline
)

SELECT * FROM mart_airline
        );
      
  