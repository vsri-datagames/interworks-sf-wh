
  
    

        create or replace transient table RECRUITMENT_DB.CANDIDATE_00183.int_flights
         as
        (WITH int_flights AS (
    SELECT
        transaction_id,  -- primary key
        flight_date,
        airline_code,  -- foreign key in int_airline
        tail_number, 
        flight_number, 
        origin_airport_code,  -- foreign key in int_airport
        dest_airport_code,  -- foreign key in int_airport

        -- Convert time fields to 'HH:MM':00 format
        TRY_CAST(CONCAT(SUBSTRING(crs_dep_time_str, 1, 2), ':', SUBSTRING(crs_dep_time_str, 3, 2), ':00') AS TIME) AS crs_dep_time,
        TRY_CAST(CONCAT(SUBSTRING(dep_time_str, 1, 2), ':', SUBSTRING(dep_time_str, 3, 2), ':00') AS TIME) AS dep_time,
        TRY_CAST(CONCAT(SUBSTRING(wheels_off_str, 1, 2), ':', SUBSTRING(wheels_off_str, 3, 2), ':00') AS TIME) AS wheels_off,
        TRY_CAST(CONCAT(SUBSTRING(wheels_on_str, 1, 2), ':', SUBSTRING(wheels_on_str, 3, 2), ':00') AS TIME) AS wheels_on,
        TRY_CAST(CONCAT(SUBSTRING(crs_arr_time_str, 1, 2), ':', SUBSTRING(crs_arr_time_str, 3, 2), ':00') AS TIME) AS crs_arr_time,
        TRY_CAST(CONCAT(SUBSTRING(arr_time_str, 1, 2), ':', SUBSTRING(arr_time_str, 3, 2), ':00') AS TIME) AS arr_time,

        taxi_out,
        taxi_in,
        dep_delay, 
        arr_delay,
        crs_lapsed_time,
        actual_lapsed_time,
        distance,

        -- Ensure the CASE statements return TRUE/FALSE by explicitly mapping the string values
        CASE 
            WHEN UPPER(cancelled) IN ('1', 'TRUE', 'T') THEN TRUE
            WHEN UPPER(cancelled) IN ('0', 'FALSE', 'F') THEN FALSE
            ELSE FALSE  -- Handle invalid values (set to FALSE)
        END AS cancelled_boolean,

        CASE 
            WHEN UPPER(diverted) IN ('1', 'TRUE', 'T') THEN TRUE
            WHEN UPPER(diverted) IN ('0', 'FALSE', 'F') THEN FALSE
            ELSE FALSE  -- Handle invalid values (set to FALSE)
        END AS diverted_boolean,
        

        -- metadata columns
        created_at,
        updated_at, 
        created_by, 
        updated_by, 
        load_date,  
        is_active,  
        processing_status,  
        error_message 
    FROM stg_flights
    WHERE 
        is_active = TRUE  -- Ensure the record is active
        AND processing_status = 'processed'  -- Ensure the record is successfully processed
        AND error_message IS NULL  -- Exclude records with error messages
        AND created_at IS NOT NULL  -- Exclude records without a creation timestamp
        AND updated_at IS NOT NULL  -- Exclude records without an update timestamp
        AND load_date IS NOT NULL  -- Ensure the record has a valid load date

)

SELECT * FROM int_flights
        );
      
  