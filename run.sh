#!/bin/bash

# Environment variables
APPLICATION_URL="http://192.168.1.10:9000" # change this to your Mealie URL
API_TOKEN="your_api_token" # Set your API token

BACKUP_PATH="/mnt/user/appdata/mealiev1/backups"
BUCKET_PATH="unraid-backup/backups/mealie" # Local backup folder path
RETENTION_DAYS=14 # Retention period in days

# create backup
response=$(curl -s -X 'POST' \
  "${APPLICATION_URL}/api/admin/backups" \
  -H 'accept: application/json' \
  -H "Authorization: Bearer ${API_TOKEN}")

echo "$response" | jq
 
# delete backups older than 14 days
find "$BACKUP_PATH" -type f -mtime +$RETENTION_DAYS -exec rm {} \;

# sync backups to S3
aws s3 sync "$BACKUP_PATH" s3://"$BUCKET_PATH" --region ap-southeast-2