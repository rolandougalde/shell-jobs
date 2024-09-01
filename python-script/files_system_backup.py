import os
import tarfile
import datetime
import logging


def backup_folder(src_folder, dest_folder):
    # Get the current date and time for the archive name
    now = datetime.datetime.now()
    archive_name = now.strftime("%Y-%m-%d-%H-%M") + ".tar.gz"
    archive_path = os.path.join(dest_folder, archive_name)

    # Create the tar.gz archive
    with tarfile.open(archive_path, "w:gz") as tar:
        for root, dirs, files in os.walk(src_folder):
            for file in files:
                file_path = os.path.join(root, file)
                tar.add(file_path, arcname=os.path.relpath(file_path, src_folder))

    # Log the backup details
    log_file = os.path.join(dest_folder, "backup.log")
    logging.basicConfig(filename=log_file, level=logging.INFO, format='%(asctime)s - %(message)s')
    for root, dirs, files in os.walk(src_folder):
        for file in files:
            file_path = os.path.join(root, file)
            logging.info(f"Added to archive: {file_path}")

    return archive_path


if __name__ == "__main__":
    # Define source and destination folders
    src_folder = "/path/to/your/source/folder"  # Change to your source folder
    dest_folder = "/path/to/your/destination/folder"  # Change to your destination folder

    # Run the backup
    backup_path = backup_folder(src_folder, dest_folder)
    print(f"Backup completed: {backup_path}")
