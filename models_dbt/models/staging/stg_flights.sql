{{ config(
    materialized = 'view'
) }}

SELECT
    year,
    month,
    carrier,
    carrier_name,
    airport,
    airport_name,
    arr_flights,
    arr_del15,
    arr_delay,
    carrier_delay,
    weather_delay,
    nas_delay,
    late_aircraft_delay
FROM {{ source('raw', 'flights_delay') }}