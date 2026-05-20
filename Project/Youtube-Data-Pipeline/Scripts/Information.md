# AWS Infrastructure Configuration
> Copy this file, fill in your values, and keep it local. Never commit real values to GitHub.

## S3 Buckets
```
Bronze S3 bucket  = <your-bronze-bucket-name>
Silver S3 bucket  = <your-silver-bucket-name>
Gold S3 bucket    = <your-gold-bucket-name>
Scripts S3 bucket = <your-scripts-bucket-name>
```

## SNS
```
SNS ARN = arn:aws:sns:<region>:<account-id>:<topic-name>:<subscription-id>
```

## Glue Databases
```
Glue Bronze DB = <your-bronze-glue-database>
Glue Silver DB = <your-silver-glue-database>
Glue Gold DB   = <your-gold-glue-database>
```

## Glue Job Parameters

### Bronze → Silver (Statistics)
```
--bronze_database = <your-bronze-glue-database>
--bronze_table    = <your-bronze-statistics-table>
--silver_bucket   = <your-silver-bucket-name>
--silver_database = <your-silver-glue-database>
--silver_table    = <your-silver-statistics-table>
```

### Silver → Gold
```
--silver_database = <your-silver-glue-database>
--gold_bucket     = <your-gold-bucket-name>
--gold_database   = <your-gold-glue-database>
```