with
    whether_cte as (
        select date(time) as daily_whether, weather, temp, pressure, humidity, clouds
        from {{ source("source", "whether") }}

    ),

    whether_cte_agg as (

        select
            daily_whether,
            weather,
            round(avg(temp), 2) as avg_temp,
            round(avg(pressure), 2) as avg_pressure,
            round(avg(humidity), 2) as avg_humidity,
            round(avg(clouds), 2) as avg_clouds

        from whether_cte

        group by daily_whether, weather

        qualify
            row_number() over (partition by daily_whether order by count(weather) desc)
            = 1

    )

select *
from whether_cte_agg
