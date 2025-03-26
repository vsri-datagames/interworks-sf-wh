{{ config(materialized='view') }}

WITH mart_flights AS (
    -- Extracting flight details
    SELECT 
        TRANSACTIONID,
        FLIGHTNUMBER,
        FLIGHTDATE,
        AIRLINECODE,
        ORIGINAIRPORTCODE,
        DESTAIRPORTCODE,
        DISTANCEGROUP,
        DEPDELAYGT15,
        NEXTDAYARR
    FROM {{ ref('fact_flights') }}
),

fact_with_airline AS (
    -- Adding airline name
    SELECT 
        f.*,
        a.AIRLINENAME
    FROM mart_flights f
    LEFT JOIN {{ ref('dim_airline') }} a 
        ON f.AIRLINECODE = a.AIRLINECODE
),

final AS (
    -- Adding airport names, city names, and state codes (origin & destination)
    SELECT 
        fact.*,
        o.AIRPORTNAME AS ORIGAIRPORTNAME,
        d.AIRPORTNAME AS DESTAIRPORTNAME,
        ocity.CITYNAME AS ORIGCITYNAME,
        ostate.STATECODE AS ORIGSTATECODE,
        dcity.CITYNAME AS DESTCITYNAME,
        dstate.STATECODE AS DESTSTATECODE,
        ostate.STATENAME AS ORIGSTATENAME, 
        dstate.STATENAME AS DESTSTATENAME  
    FROM fact_with_airline fact
    LEFT JOIN {{ ref('dim_airport') }} o
        ON fact.ORIGINAIRPORTCODE = o.AIRPORTCODE
    LEFT JOIN {{ ref('dim_airport') }} d 
        ON fact.DESTAIRPORTCODE = d.AIRPORTCODE
    LEFT JOIN {{ ref('dim_airport') }} ocity
        ON fact.ORIGINAIRPORTCODE = ocity.AIRPORTCODE
    LEFT JOIN {{ ref('dim_airport') }} ostate
        ON fact.ORIGINAIRPORTCODE = ostate.AIRPORTCODE
    LEFT JOIN {{ ref('dim_airport') }} dcity
        ON fact.DESTAIRPORTCODE = dcity.AIRPORTCODE
    LEFT JOIN {{ ref('dim_airport') }} dstate
        ON fact.DESTAIRPORTCODE = dstate.AIRPORTCODE
)

SELECT 
    TRANSACTIONID,
    FLIGHTNUMBER,
    FLIGHTDATE,
    AIRLINECODE,
    AIRLINENAME,
    ORIGINAIRPORTCODE,
    ORIGAIRPORTNAME,
    ORIGCITYNAME,
    ORIGSTATECODE,
    ORIGSTATENAME, 
    DESTAIRPORTCODE,
    DESTAIRPORTNAME,
    DESTCITYNAME,
    DESTSTATECODE,
    DESTSTATENAME, 
    DISTANCEGROUP,
    DEPDELAYGT15,
    NEXTDAYARR 
FROM final
