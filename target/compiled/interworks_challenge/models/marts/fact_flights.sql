WITH int_flights AS (
    SELECT 
        transaction_id AS TRANSACTIONID,  -- primary key
        flight_date AS FLIGHTDATE, 
        airline_code AS AIRLINECODE, -- foreign key
        tail_number AS TAILNUMBER, -- foreign key
        flight_number AS FLIGHTNUMBER, 
        origin_airport_code AS ORIGINAIRPORTCODE, 
        dest_airport_code AS DESTAIRPORTCODE,
        crs_dep_time AS CRSDEPTIME, 
        dep_time AS DEPTIME, 
        wheels_off AS WHEELSOFF, 
        wheels_on AS WHEELSON, 
        crs_arr_time AS CRSARRTIME, 
        arr_time AS ARRTIME, 
        taxi_out AS TAXIOUT, 
        taxi_in AS TAXIIN, 
        dep_delay AS DEPDELAY, 
        arr_delay AS ARRDELAY, 
        crs_lapsed_time AS CRSLAPSEDTIME, 
        actual_lapsed_time AS ACTUALLAPSEDTIME, 
        distance AS DISTANCE,
        cancelled_boolean AS CANCELLED, 
        diverted_boolean AS DIVERTED, 
        -- Metadata columns
        created_at AS CREATEDAT, 
        updated_at AS UPDATEDAT, 
        created_by AS CREATEDBY, 
        updated_by AS UPDATEDBY, 
        load_date AS LOADDATE, 
        is_active AS ISACTIVE, 
        processing_status AS PROCESSINGSTATUS, 
        error_message AS ERRORMESSAGE
    FROM RECRUITMENT_DB.CANDIDATE_00183.int_flights  
),

fact_flights AS (
    SELECT *,

        -- Add DISTANCEGROUP with bins in 100-mile increments
        CONCAT(
            (FLOOR(TRY_CAST(REPLACE(DISTANCE, ' miles', '') AS INT) / 100) * 100) + 1, 
            '-', 
            (FLOOR(TRY_CAST(REPLACE(DISTANCE, ' miles', '') AS INT) / 100) * 100) + 100, 
            ' miles'
        ) AS DISTANCEGROUP,
        
         -- Add DEPDELAYGT15 (1/0 if DEPDELAY > 15)
        CASE 
            WHEN DEPDELAY > 15 THEN 1
            ELSE 0
        END AS DEPDELAYGT15,

        -- Convert FLIGHTDATE and DEPTIME to a timestamp (combining date and time) - assuming same timezone
        TO_TIMESTAMP(FLIGHTDATE || ' ' || DEPTIME) AS DEPTIMESTAMP,
        -- Calculate the actual arrival time by adding ACTUALLAPSEDTIME (in minutes) to DEPTIMESTAMP
        DATEADD(MINUTE, ACTUALLAPSEDTIME, TO_TIMESTAMP(FLIGHTDATE || ' ' || DEPTIME)) AS ARRTIMESTAMP,
        -- Determine if the arrival time is the next day
        CASE
            WHEN DATE(ARRTIMESTAMP) > FLIGHTDATE THEN 1 -- Flight crosses into the next day
            ELSE 0 -- Flight does not cross into the next day
        END AS NEXTDAYARR

    FROM int_flights
)

SELECT * FROM fact_flights