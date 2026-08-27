with
    bike_cte as (
        select distinct
            start_station_id as station_id,
            start_station_name as station_name,
            start_lat as start_station_lat,
            start_lng as start_station_lng,

        from {{ source("source", "bike_trips") }}

    )
select *
from bike_cte
