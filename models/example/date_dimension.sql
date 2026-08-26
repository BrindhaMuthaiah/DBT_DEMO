with CTE as (

select
to_timestamp(started_at) as Started_at,
date(to_timestamp(started_at)) as Date_Started_at,
Hour(to_timestamp(started_at)) as Hour_Started_at,

Case
When DAYNAME(to_timestamp(started_at)) in ('Sat','Sun')
Then 'Weekend'
Else 'Weekdays'
End as Day_type,

Case
When Month(to_timestamp(started_at)) in (12,1,2)
Then 'Winter'
When Month(to_timestamp(started_at)) in (3,4,5)
Then 'Spring'
When Month(to_timestamp(started_at)) in (6,7,8)
Then 'Summer'
Else 'Autumn'
End as Station_of_year

from
{{ source('source', 'bike_trips') }}

)

select * from CTE

