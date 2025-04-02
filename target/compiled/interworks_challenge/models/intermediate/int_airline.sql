WITH distinct_airline AS (
    SELECT DISTINCT 
        airline_code, 
        airline_name
    FROM RECRUITMENT_DB.CANDIDATE_00183.stg_flights
)

SELECT * FROM distinct_airline