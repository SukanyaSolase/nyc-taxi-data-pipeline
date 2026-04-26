# NYC Taxi Data Pipeline

End-to-end data engineering project using NYC TLC Trip Data.

## Tech Stack

- Python, Pandas, SQLAlchemy
- AWS S3
- PostgreSQL (local) / Redshift (production)
- dbt (coming Day 4-6)
- Metabase dashboard (coming Day 7)

## dbt Models

| Layer        | Model              | Description                         |
| ------------ | ------------------ | ----------------------------------- |
| Staging      | stg_trips          | Cleans raw data, filters bad rows   |
| Intermediate | int_trips_daily    | Aggregates 3M rows to daily metrics |
| Mart         | mart_trips_summary | Business metrics for dashboard      |

## Progress

- [x] Day 1-2: AWS setup + S3 upload
- [x] Day 3: Load 3M rows into PostgreSQL
- [x] Day 4: dbt setup + connected to PostgreSQL
- [x] Day 5: Built 3-layer dbt transformation models
- [ ] Day 6: dbt tests + documentation
- [ ] Day 7: Metabase dashboard
