select
    departure_day
    , hour_departure
    , hour_arrival
    , id_product
    , line
    , stops_name
    , status
    , late_departure
    , late_arrival
from {{ source('lake', 'bronze_table_train') }}
