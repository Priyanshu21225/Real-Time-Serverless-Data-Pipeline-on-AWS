# YouTube Trending Data Pipeline

A serverless AWS data pipeline that collects YouTube trending video data across 10 regions and transforms it into an analytics-ready dataset.

Every 6 hours, it pulls live trending videos from the YouTube Data API, cleans and validates the data through a Bronze → Silver → Gold architecture, and produces aggregated Parquet datasets ready for analysis. The entire pipeline is orchestrated by AWS Step Functions with SNS alerts for failures.

## Tech Stack

| Layer | Service |
|---|---|
| Orchestration | AWS Step Functions |
| Ingestion | AWS Lambda + YouTube Data API v3 |
| Storage | AWS S3 (Bronze / Silver / Gold) |
| ETL | AWS Glue (PySpark) |
| Data Catalog | AWS Glue Data Catalog + Athena |
| Data Quality | AWS Lambda + AWS Wrangler |
| Alerts | AWS SNS |



## Architecture

```
YouTube Data API
      │
      ▼
[ Lambda: Ingestion ]         ← Runs every 6 hours via EventBridge
      │
      ├──────────────────────────────────┐
      ▼                                  ▼
[ Lambda: Reference Data ]    [ Glue Job: Bronze → Silver ]
  JSON → Parquet                  Clean, deduplicate, cast types
      │                                  │
      └──────────────┬───────────────────┘
                     ▼
         [ Lambda: Data Quality ]    ← Validates before proceeding
                     │
                     ▼
         [ Glue Job: Silver → Gold ] ← Aggregations and enrichment
                     │
                     ▼
           [ S3: Gold Layer ]        ← Analytics-ready dataset
```


<img width="1399" height="771" alt="image" src="https://github.com/user-attachments/assets/c472e510-96ed-4320-8fab-486bbd223d10" />
