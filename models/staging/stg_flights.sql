WITH raw_flights as (
    SELECT
        TRANSACTIONID::varchar(20) as transaction_id,  
        FLIGHTDATE::date as flight_date,  
        AIRLINECODE::varchar(3) as airline_code,  -- allowing for 3-character airline code in future, currently all 2
        AIRLINENAME::varchar as airline_name, 
        TAILNUM::varchar(10) as tail_number,  -- allowing for up to 10 chars in future, currently max at 6
        FLIGHTNUM::varchar(10) as flight_number,  -- allowing for up to 10 mixed chars in future, currently max at 4 and all integers
        ORIGINAIRPORTCODE::varchar(3) as origin_airport_code,  -- Assuming 3-character airport code always, verified
        ORIGAIRPORTNAME::varchar(100) as origin_airport_name,  
        ORIGINCITYNAME::varchar(100) as origin_city_name,  
        ORIGINSTATE::varchar(2) as origin_state,  -- 2-character state code always, verified
        ORIGINSTATENAME::varchar(100) as origin_state_name,  -- 
        DESTAIRPORTCODE::varchar(3) as dest_airport_code, 
        DESTAIRPORTNAME::varchar(100) as dest_airport_name,  
        DESTCITYNAME::varchar(100) as dest_city_name,  
        DESTSTATE::varchar(2) as dest_state,
        DESTSTATENAME::varchar(100) as dest_state_name, 
        CRSDEPTIME::varchar(4) as crs_dep_time_str,  
        DEPTIME::varchar(4) as dep_time_str, 
        DEPDELAY::int as dep_delay, 
        TAXIOUT::int as taxi_out,
        WHEELSOFF::varchar(4) as wheels_off_str,  
        WHEELSON::varchar(4) as wheels_on_str,  
        TAXIIN::int as taxi_in, 
        CRSARRTIME::varchar(4) as crs_arr_time_str,  
        ARRTIME::varchar(4) as arr_time_str, 
        ARRDELAY::int as arr_delay,  
        CRSELAPSEDTIME::int as crs_lapsed_time,  
        ACTUALELAPSEDTIME::int as actual_lapsed_time, 
        CANCELLED::varchar(10) as cancelled,  
        DIVERTED::varchar(10) as diverted,  
        DISTANCE::varchar(20) as distance  
    from {{ source('recruitment_db', 'raw_flights') }}  -- Reference the external source
),

stg_flights as (
    SELECT
       transaction_id, -- primary key
       flight_date,
       airline_code,
       airline_name,
       tail_number, 
       flight_number, 
       origin_airport_code,
       origin_airport_name,
       origin_city_name,
       origin_state,
       origin_state_name,
       dest_airport_code,
       dest_airport_name,
       dest_city_name,
       dest_state,
       dest_state_name,
       crs_dep_time_str,
       dep_time_str, 
       dep_delay, 
       taxi_out, 
       wheels_off_str, 
       wheels_on_str, 
       taxi_in, 
       crs_arr_time_str,
       arr_time_str,
       arr_delay,
       crs_lapsed_time,
       actual_lapsed_time,
       cancelled,
       diverted,
       distance,

        -- Metadata columns
        CURRENT_TIMESTAMP AS created_at,        -- Timestamp when the record is created
        CURRENT_TIMESTAMP AS updated_at,        -- Timestamp when the record is updated
        CURRENT_USER() AS created_by,           -- Snowflake user who created the record
        CURRENT_USER() AS updated_by,           -- Snowflake user who last updated the record
        '{{ source('recruitment_db', 'raw_flights') }}' AS record_source,  -- Database and schema info as the source of the data
        TRUE AS is_active,                      -- Flag indicating if the record is active
        CURRENT_DATE AS load_date,              -- Date when the data was loaded
        'processed' AS processing_status,      -- Status of data processing (e.g., 'processed')
        NULL AS error_message                   -- Placeholder for error messages
    FROM raw_flights
)

SELECT * FROM stg_flights
