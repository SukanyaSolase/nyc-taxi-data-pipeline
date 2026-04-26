-- Staging layer: clean nulls, rename columns, cast types
SELECT
    vendor_id,
    pickup_datetime::timestamp,
    dropoff_datetime::timestamp,
    passenger_count,
    trip_distance,
    payment_type,
    fare_amount,
    tip_amount,
    total_amount,
    congestion_surcharge
FROM raw_trips
WHERE fare_amount > 0
  AND trip_distance > 0
  AND passenger_count > 0
