#!/bin/bash

# Set the backup directory
backup_dir="/home/xanatos/backups"

# Set the database name
db_name="database01"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Create a dated compressed backup file
backup_file="$backup_dir/${db_name}-backup-$(date +%Y-%m-%d-%H-%M).sql.gz"

# Perform the MySQL dump
mysqldump -u root -p -R -E --triggers --single-transaction "$db_name" | gzip > "$backup_file"

# Check if the mysqldump was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully. File: $backup_file"
else
    echo "Error: MySQL dump failed."
fi
