import os
import tarfile
import datetime
import subprocess
import logging

def backup_mysql(databases, user, password, dest_folder):
    # Get the current date and time for the archive name
    now = datetime.datetime.now()
    archive_name = now.strftime("%Y-%m-%d-%H-%M") + ".tar.gz"
    archive_path = os.path.join(dest_folder, archive_name)

    # Create a folder to store individual database backups
    temp_folder = os.path.join(dest_folder, "mysql_backup_temp")
    os.makedirs(temp_folder, exist_ok=True)

    dumped_files = []

    # Dump each database
    for db in databases:
        dump_file = os.path.join(temp_folder, f"{db}.sql")
        dump_command = ["mysqldump", "-u", user, f"--password={password}", db]
        with open(dump_file, "w") as f:
            subprocess.run(dump_command, stdout=f, check=True)
        dumped_files.append(dump_file)

    # Create the tar.gz archive
    with tarfile.open(archive_path, "w:gz") as tar:
        for file in dumped_files:
            tar.add(file, arcname=os.path.basename(file))

    # Log the backup details
    log_file = os.path.join(dest_folder, "backup.log")
    logging.basicConfig(filename=log_file, level=logging.INFO, format='%(asctime)s - %(message)s')
    for file in dumped_files:
        logging.info(f"Added to archive: {file}")

    # Clean up temporary files
    for file in dumped_files:
        os.remove(file)
    os.rmdir(temp_folder)

    return archive_path

if __name__ == "__main__":
    # Define MySQL credentials and destination folder
    user = "your_mysql_user"  # Replace with your MySQL username
    password = "your_mysql_password"  # Replace with your MySQL password
    databases = ["database1", "database2"]  # Replace with your list of databases to back up
    dest_folder = "/path/to/your/destination/folder"  # Replace with your destination folder

    # Run the backup
    backup_path = backup_mysql(databases, user, password, dest_folder)
    print(f"Backup completed: {backup_path}")
