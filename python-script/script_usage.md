# Linux File System Backup

**Backup Creation:**
The script compresses the contents of a source folder into a .tar.gz archive named based on the current date and time (e.g., web_app_2024_08_31_14_30.atr.gz).

**Logging:**
After creating the archive, it logs each file added to the archive in a backup.log file located in the destination folder, including the date and time of the operation.

**Usage:**

Replace `/path/to/your/source/folder` with the folder you want to back up.
Replace `/path/to/your/destination/folder` with the folder where you want to store the archive and log file.

Run the script to back up the specified folder.

This script should work with any standard Linux environment with Python 3 installed.

# Linux My-SQL Database Backup

**Backup Creation:** 

The script performs the following steps:

- Dumps the specified MySQL databases into individual .sql files using the mysqldump command.
- Compresses the .sql files into a .tar.gz archive named with the current date and time (e.g., database_2024_08_31_14_30.tar.gz).

**Logging:**

After creating the archive, it logs each dumped database file added to the archive in a backup.log file located in the destination folder, including the date and time of the operation.

**Cleanup:** The script removes the temporary .sql files and the temporary directory used to store them after the archive is created.

**Usage:**

- Replace your_mysql_user with your MySQL username.
- Replace your_mysql_password with your MySQL password.
- Replace the databases list with the names of the databases you want to back up.
- Replace /path/to/your/destination/folder with the folder where you want to store the archive and log file.
- Run the script to back up the specified MySQL databases.
- This script assumes you have the necessary permissions to run mysqldump and that mysqldump is available in your system's PATH.

Reggards :smiley_cat: