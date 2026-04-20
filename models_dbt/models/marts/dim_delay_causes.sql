{{ config(
    materialized = 'table'
) }}

WITH base AS (

    SELECT *
    FROM {{ ref('fct_flight_delays') }}

),

dim_delay_causes AS (

    SELECT 
        'Carrier' AS delay_type,
        SUM(carrier_delay) AS delay_minutes
    FROM base

    UNION ALL

    SELECT 
        'Weather',
        SUM(weather_delay)
    FROM base

    UNION ALL

    SELECT 
        'NAS',
        SUM(nas_delay)
    FROM base

    UNION ALL

    SELECT 
        'Late Aircraft',
        SUM(late_aircraft_delay)
    FROM base

)

SELECT * FROM dim_delay_causes