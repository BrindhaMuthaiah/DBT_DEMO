with
    correlation_cte as (
        select t.*, w.*
        from {{ ref("trip_fact") }} as t
        left join {{ ref("daliy_whether") }} as w on t.trip_date = w.daily_whether
        order by trip_date desc
    )

select *
from correlation_cte
