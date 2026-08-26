with CTE as (

select
to_timestamp(started_at) as Started_at,
date(to_timestamp(started_at)) as Date_Started_at,
Hour(to_timestamp(started_at)) as Hour_Started_at,

{{get_datetype('started_at')}} as Day_type,

{{get_season('started_at')}} Station_of_year

from
{{ source('source', 'bike_trips') }}

)

select * from CTE

