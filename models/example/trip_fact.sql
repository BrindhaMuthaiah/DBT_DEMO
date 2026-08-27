with
    trip_cte as (
        select

            ride_id,
            rideable_type,
            date(to_timestamp(started_at)) as trip_date,
            start_station_id as start_station_id,
            end_station_id as end_station_id,
            member_casual as member_casual,
            timestampdiff(seconds, to_timestamp(started_at), to_timestamp(ended_at)) as trip_duration_seconds

        from {{ source("source", "bike_trips") }}
    )

select *
from trip_cte
