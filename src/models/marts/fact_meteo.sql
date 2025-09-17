{{
    config(
        materialized='incremental',
        unique_key=['station_name', 'mesure_timestamp']
    )
}}

select
    station_name
    , mesure_timestamp
    , temperature_celsius
    , wind_speed_km_h
    , precipitation
    , snow_height
    , sunshine_hour_duration
from {{ ref('stg_meteo') }}