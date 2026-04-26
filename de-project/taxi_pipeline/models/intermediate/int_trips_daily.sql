-- Intermediate layer: aggregate by day
SELECT
    DATE_TRUNC('day', pickup_datetime) AS trip_date,
    COUNT(*) AS total_trips,
    AVG(trip_distance) AS avg_distance,
    SUM(fare_amount) AS total_revenue,
    SUM(tip_amount) AS total_tips
FROM {{ ref('stg_trips') }}
GROUP BY 1
