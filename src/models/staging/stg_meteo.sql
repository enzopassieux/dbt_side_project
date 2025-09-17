select
    station as station_name
    , to_timestamp(reference_timestamp, 'DD.MM.YYYY hh24:mi') as mesure_timestamp
    , temperature::float as temperature_celsius
    , wind_speed::float as wind_speed_km_h
    , precipitation::float as precipitation
    , snow_height::float as snow_height
    , sunshine_duration::number as sunshine_hour_duration
from {{ ref('base_meteo') }}