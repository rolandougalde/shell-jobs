#!/bin/bash

# Set the backup directory and timestamp
backup_dir="/home/dev-team/backups"
timestamp=$(date +"%Y_%m_%d_%H_%M")

# Define the database name you want to back up
db_name="database01"

# Create a directory to store the backup
mkdir -p "$backup_dir/$db_name"

# Perform the MongoDB backup
mongodump --out="$backup_dir/$db_name"

# Check if the mongodump was successful
if [ $? -eq 0 ]; then
    # Create a compressed archive of the backup
    tar -zcvf "$backup_dir/$db_name-$timestamp.tar.gz" "$backup_dir/$db_name"

    # Check if the tar command was successful
    if [ $? -eq 0 ]; then
        # Remove the unarchived backup
        rm -r "$backup_dir/$db_name"
        echo "Backup completed successfully."
    else
        echo "Error: Unable to create the archive."
    fi
else
    echo "Error: MongoDB backup failed."
fi
