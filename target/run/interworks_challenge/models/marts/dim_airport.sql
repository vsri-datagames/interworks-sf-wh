
  
    

        create or replace transient table RECRUITMENT_DB.CANDIDATE_00183.dim_airport
         as
        (WITH mart_airport AS (
    SELECT 
        airport_id AS AIRPORTID,
        airport_code AS AIRPORTCODE, 
        SPLIT_PART(airport_name, ': ', 2) AS AIRPORTNAME, 
        city_name AS CITYNAME,
        state_code AS STATECODE, 
        state_name AS STATENAME
    FROM  RECRUITMENT_DB.CANDIDATE_00183.int_airport

SELECT * FROM mart_airport
        );
      
  