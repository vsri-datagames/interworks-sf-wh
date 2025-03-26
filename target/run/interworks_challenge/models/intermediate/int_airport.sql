
  
    

        create or replace transient table RECRUITMENT_DB.CANDIDATE_00183.int_airport
         as
        (WITH distinct_airports AS (
    -- Get distinct airport and city info from origin airports
    SELECT DISTINCT
        origin_airport_code AS airport_code,
        origin_airport_name AS airport_name,
        origin_city_name AS city_name,
        origin_state AS state_code,
        origin_state_name AS state_name
    FROM RECRUITMENT_DB.CANDIDATE_00183.stg_flights

    UNION 

    -- Get distinct airport and city info from destination airports
    SELECT DISTINCT
        dest_airport_code AS airport_code,
        dest_airport_name AS airport_name,
        dest_city_name AS city_name,
        dest_state AS state_code,
        dest_state_name AS state_name
    FROM RECRUITMENT_DB.CANDIDATE_00183.stg_flights
),

final_airports AS (
    SELECT
        a.airport_code,
        a.airport_name,
        a.city_name,
        -- Join city details from city_state_lookup only if null
        COALESCE(a.state_code, l.state_code) AS state_code, 
        COALESCE(a.state_name, l.state_name) AS state_name
    FROM distinct_airports a
    LEFT JOIN RECRUITMENT_DB.CANDIDATE_00183.city_state_lookup l 
    ON a.city_name = l.city_name
)

SELECT 
    MD5(airport_code) AS airport_id,  -- Primary key based on airport code
    airport_code, 
    airport_name, 
    city_name,
    state_code,
    state_name
FROM final_airports
        );
      
  