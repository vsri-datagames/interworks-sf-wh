WITH distinct_airline AS (
    SELECT DISTINCT 
        airline_code, 
        airline_name
    FROM stg_flights
)

SELECT * FROM distinct_airline
