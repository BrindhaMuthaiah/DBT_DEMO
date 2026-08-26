{% macro get_season(x) %}

Case
When Month(to_timestamp({{x}})) in (12,1,2)
Then 'Winter'
When Month(to_timestamp({{x}})) in (3,4,5)
Then 'Spring'
When Month(to_timestamp({{x}})) in (6,7,8)
Then 'Summer'
Else 'Autumn'
End 

{% endmacro %}

{% macro get_datetype(x) %}

Case
When DAYNAME(to_timestamp({{x}})) in ('Sat','Sun')
Then 'Weekend'
Else 'Weekdays'
End 

{% endmacro%}