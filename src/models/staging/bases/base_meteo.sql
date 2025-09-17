select
    station
    , reference_timestamp
    , temperature
    , wind_speed
    , precipitation
    , snow_height
    , sunshine_duration
from {{ source('lake', 'bronze_table_meteo') }}
