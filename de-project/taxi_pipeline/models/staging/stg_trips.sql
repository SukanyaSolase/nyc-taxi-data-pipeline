-- Staging layer: clean nulls, rename columns, cast types
SELECT vendor_id,
  CAST(pickup_datetime AS TIMESTAMP) AS pickup_datetime,
  CAST(dropoff_datetime AS TIMESTAMP) AS dropoff_datetime,
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