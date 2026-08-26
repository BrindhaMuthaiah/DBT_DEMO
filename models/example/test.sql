select * from {{ source('source', 'bike_trips') }} limit=10;
