import pandas as pd
import os
from sqlalchemy import create_engine

# Connection
DB_PASSWORD = os.environ.get('DB_PASSWORD', 'yourpassword')
engine = create_engine(f'postgresql://postgres:{DB_PASSWORD}@localhost:5432/de_project')

# Read parquet file
print("Reading parquet file...")
df = pd.read_parquet('/Users/sukanya/de-project/yellow_tripdata_2023-01.parquet')

# Keep only columns we need
df = df[[
    'VendorID',
    'tpep_pickup_datetime',
    'tpep_dropoff_datetime', 
    'passenger_count',
    'trip_distance',
    'payment_type',
    'fare_amount',
    'tip_amount',
    'total_amount',
    'congestion_surcharge'
]]

# Rename columns to clean names
df.columns = [
    'vendor_id',
    'pickup_datetime',
    'dropoff_datetime',
    'passenger_count',
    'trip_distance',
    'payment_type',
    'fare_amount',
    'tip_amount',
    'total_amount',
    'congestion_surcharge'
]

# Load into PostgreSQL
print(f"Loading {len(df)} rows into PostgreSQL...")
df.to_sql('raw_trips', engine, if_exists='replace', index=False, chunksize=10000)
print("Done! Data loaded into raw_trips table.")