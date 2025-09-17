{{
    config(
        materialized='incremental',
        unique_key=['station_name', 'departure_day', 'departure_time','arrival_time']
    )
}}

with dedup as (
    select
        station_name,
        departure_day,
        departure_time,
        arrival_time,
        line,
        stops_name,
        status,
        is_departure_late,
        is_arrival_late,
        row_number() over (
            partition by station_name, departure_day, departure_time, arrival_time
            order by line, stops_name
        ) as rn
    from {{ ref('stg_train') }}
    where departure_time is not null
      and arrival_time is not null
)

select
    station_name,
    departure_day,
    departure_time,
    arrival_time,
    line,
    stops_name,
    status,
    is_departure_late,
    is_arrival_late
from dedup
where rn = 1
