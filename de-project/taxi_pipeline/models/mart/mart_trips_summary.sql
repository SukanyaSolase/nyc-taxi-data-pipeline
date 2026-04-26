-- Mart layer: final clean table ready for dashboard
SELECT
    trip_date,
    total_trips,
    avg_distance,
    total_revenue,
    total_tips,
    ROUND((total_revenue / total_trips)::numeric, 2) AS revenue_per_trip,
    ROUND((total_tips / total_revenue * 100)::numeric, 2) AS tip_percentage
FROM {{ ref('int_trips_daily') }}
ORDER BY trip_date
