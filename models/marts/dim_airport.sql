WITH mart_airport AS (
    SELECT 
        airport_id AS AIRPORTID,
        airport_code AS AIRPORTCODE, 
        SPLIT_PART(airport_name, ': ', 2) AS AIRPORTNAME, 
        city_name AS CITYNAME,
        state_code AS STATECODE, 
        state_name AS STATENAME
    FROM int_airport
)

SELECT * FROM mart_airport
