<link rel="stylesheet" type="text/css" href="https://github.com/rolandougalde/shell-jobs/blob/main/assets/css/cs50-for-md.css">

# Project: Shell-Jobs :shell:

## Overview

This project contains a collection of small, individual scripts written in various programming languages. Each script is designed to perform basic backup tasks. These tasks include backing up file systems, synchronizing folders, and backing up databases such as MySQL or MongoDB. The scripts utilize compression techniques (such as `tar.gz` or `7zip`) and create backups with date-descriptive filenames. Each script also logs the details of the backup operations to a text log.

## Features

- **File System Backup**: Scripts that create compressed backups of specified directories.
- **Folder Synchronization**: Scripts that synchronize folders using `rsync`.
- **Database Backup**: Scripts to back up MySQL and MongoDB databases.
- **Compression**: Supports `tar.gz` and `7zip` formats for compressed backups.
- **Logging**: Each backup operation logs the details (such as files included and timestamps) to a text log file.
- **Log Clear**: log clearing for IIS and Linux Journal supported.

## Scripts

### 1. File System Backup

- **Languages**: Shell Script, PowerShell, Python and Batch
- **Functionality**: Creates a compressed archive (`tar.gz` or `7zip`) of a specified directory, with the archive named using the current date and time. Logs the backup details.

### 2. Folder Synchronization with `rsync`

- **Languages**: Shell Script, PowerShell, Python and Batch
- **Functionality**: Synchronizes two folders using `rsync`. Optionally creates a compressed archive of the synchronized folder and logs the synchronization details.

### 3. MySQL Database Backup

- **Languages**: Shell Script, PowerShell, Python and Batch
- **Functionality**: Dumps MySQL databases to `.sql` files, compresses them, and names the archive with the current date and time. Logs the backup details.

### 4. MongoDB Database Backup

- **Languages**: Shell Script, PowerShell, Python and Batch
- **Functionality**: Dumps MongoDB databases, compresses the dumps, and names the archive with the current date and time. Logs the backup details.

## Usage

1. **Edit Script Parameters**: Before running any script, open it and configure the necessary parameters such as source directories, destination paths, database credentials, etc.
2. **Run the Script**: Execute the script in its respective environment (Python, Bash, etc.).
3. **Check the Log**: After execution, refer to the log file generated in the destination folder for details of the backup operation.

## Requirements

- **For Windows machines:** the latest version of PowerShell and 7zip.
- **Python**: For Python scripts, ensure Python 3.x is installed along with any required libraries (e.g., `subprocess`, `tarfile`).
- **Bash**: For Bash scripts, ensure you have a Unix-like environment with access to `rsync`, `mysqldump`, `mongodump`, and compression tools like `tar` or `7zip`.

## Notes

- Ensure you have the necessary permissions to access and modify the directories or databases you intend to back up.
- Regularly verify the log files to ensure backups are successful and stored as expected.
- These scripts are designed for simplicity and may need customization for complex environments.

## License

This project is released under the MIT License. You are free to use, modify, and distribute the scripts as needed.

## Contributions

Contributions to improve these scripts are welcome. Please submit a pull request or open an issue to discuss any changes or enhancements.
