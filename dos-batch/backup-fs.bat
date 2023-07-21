cls

@echo off
echo .:file-backup:.
echo Modified: 2023-07-20 - By Rolo.
echo ServerName: [server-name]
echo Archives accounting files and move them to the NAS.

echo This script is intended to use with 7z v23.01..

ECHO Creates a ZIP archive, named with current date and time.
"C:\Program Files\7-zip\7z.exe" a -tzip -ssw D:\Backup\[fs-name]-files-%date:~-4,4%-%date:~-10,2%-%date:~-7,2%-%time:~0,2%-%time:~3,2% D:\[fs-name]\ >[log-name]-%date:~-4,4%-%date:~-10,2%-%date:~-7,2%-%time:~0,2%-%time:~3,2%.txt 2>&1

ECHO Creates a TAR archive, named with current date and time.
"C:\Program Files\7-zip\7z.exe" a -ttar -ssw D:\Backup\[fs-name]-files-%date:~-4,4%-%date:~-10,2%-%date:~-7,2%-%time:~0,2%-%time:~3,2% D:\[fs-name]\ >[log-name]-%date:~-4,4%-%date:~-10,2%-%date:~-7,2%-%time:~0,2%-%time:~3,2%.txt 2>&1

echo Removing work files...
move D:\Backup\*.zip \\[NAS]\Backup\[fs-name]
