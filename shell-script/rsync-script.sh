#!/bin/bash

# Define source and destination
SOURCE="/var/www/website/"
DESTINATION="user@server:/var/www/website/"

# Execute rsync with options
/usr/bin/rsync -azv --delete "$SOURCE" "$DESTINATION"

# Exit status handling
if [ $? -eq 0 ]; then
    echo "Sync completed successfully!"
else
    echo "Sync encountered an error."
fi

