#!/bin/bash

# Development database credentials
DEV_DB_NAME="your_dev_database_name"
DEV_DB_USER="your_dev_username"
DEV_DB_PASSWORD="your_dev_password"
DEV_DB_HOST="your_dev_host"

# Local database credentials
LOCAL_DB_NAME="your_local_database_name"
LOCAL_DB_USER="your_local_username"
LOCAL_DB_PASSWORD="your_local_password"
LOCAL_DB_HOST="localhost"

# Dump the development database
mysqldump -h $DEV_DB_HOST -u $DEV_DB_USER -p$DEV_DB_PASSWORD $DEV_DB_NAME > dev_database_dump.sql

# Create the local database
mysql -h $LOCAL_DB_HOST -u $LOCAL_DB_USER -p$LOCAL_DB_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $LOCAL_DB_NAME"

# Import the development database dump into the local database
mysql -h $LOCAL_DB_HOST -u $LOCAL_DB_USER -p$LOCAL_DB_PASSWORD $LOCAL_DB_NAME < dev_database_dump.sql

# Optional: Remove the development database dump file
rm dev_database_dump.sql

echo "Database cloned successfully from dev to local."
