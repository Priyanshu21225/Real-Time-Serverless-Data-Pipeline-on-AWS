#!/bin/bash
# ─────────────────────────────────────────────────────────────────────────────
# Script: Upload Kaggle raw data to Bronze S3 bucket
# Usage:  BRONZE_BUCKET=<your-bucket-name> bash upload_to_s3.sh
# ─────────────────────────────────────────────────────────────────────────────

# Set your Bronze bucket name as an environment variable before running:
# export BRONZE_BUCKET=<your-bronze-bucket-name>

if [ -z "$BRONZE_BUCKET" ]; then
  echo "ERROR: BRONZE_BUCKET environment variable is not set."
  echo "Usage: BRONZE_BUCKET=<your-bucket-name> bash upload_to_s3.sh"
  exit 1
fi

# Germany (DE)
aws s3 cp DEvideos.csv s3://$BRONZE_BUCKET/youtube/raw_statistics/region=de/
aws s3 cp DE_category_id.json s3://$BRONZE_BUCKET/youtube/raw_statistics_reference_data/region=de/

# France (FR)
aws s3 cp FRvideos.csv s3://$BRONZE_BUCKET/youtube/raw_statistics/region=fr/
aws s3 cp FR_category_id.json s3://$BRONZE_BUCKET/youtube/raw_statistics_reference_data/region=fr/

# Great Britain (GB)
aws s3 cp GBvideos.csv s3://$BRONZE_BUCKET/youtube/raw_statistics/region=gb/
aws s3 cp GB_category_id.json s3://$BRONZE_BUCKET/youtube/raw_statistics_reference_data/region=gb/

# India (IN)
aws s3 cp INvideos.csv s3://$BRONZE_BUCKET/youtube/raw_statistics/region=in/
aws s3 cp IN_category_id.json s3://$BRONZE_BUCKET/youtube/raw_statistics_reference_data/region=in/

# Japan (JP)
aws s3 cp JPvideos.csv s3://$BRONZE_BUCKET/youtube/raw_statistics/region=jp/
aws s3 cp JP_category_id.json s3://$BRONZE_BUCKET/youtube/raw_statistics_reference_data/region=jp/

# Korea (KR)
aws s3 cp KRvideos.csv s3://$BRONZE_BUCKET/youtube/raw_statistics/region=kr/
aws s3 cp KR_category_id.json s3://$BRONZE_BUCKET/youtube/raw_statistics_reference_data/region=kr/

# Mexico (MX)
aws s3 cp MXvideos.csv s3://$BRONZE_BUCKET/youtube/raw_statistics/region=mx/
aws s3 cp MX_category_id.json s3://$BRONZE_BUCKET/youtube/raw_statistics_reference_data/region=mx/

# Russia (RU)
aws s3 cp RUvideos.csv s3://$BRONZE_BUCKET/youtube/raw_statistics/region=ru/
aws s3 cp RU_category_id.json s3://$BRONZE_BUCKET/youtube/raw_statistics_reference_data/region=ru/

# United States (US)
aws s3 cp USvideos.csv s3://$BRONZE_BUCKET/youtube/raw_statistics/region=us/
aws s3 cp US_category_id.json s3://$BRONZE_BUCKET/youtube/raw_statistics_reference_data/region=us/

echo "Upload complete."