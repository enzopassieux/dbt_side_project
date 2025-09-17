with raw as (
    select
        departure_day::date as departure_day,

        
        try_to_timestamp(hour_departure, 'YYYY-MM-DD HH24:MI:SS') as departure_time,
        try_to_timestamp(hour_arrival, 'YYYY-MM-DD HH24:MI:SS') as arrival_time,

        id_product as station_name,
        line,
        stops_name,
        status,
        late_departure::boolean as is_departure_late,
        late_arrival::boolean as is_arrival_late
    from {{ ref('base_train') }}
)


select *
from raw
where departure_time is not null
  and arrival_time is not null
