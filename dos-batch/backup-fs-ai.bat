@echo off
echo .:file-backup + openai:.
echo Modified: 2023-07-22 - By Rolo.
echo ServerName: Premier-FS
echo Archives shared files and move them to the NAS.

setlocal enabledelayedexpansion

REM Set variables for date and time
set "YYYY=%date:~-4%"
set "MM=%date:~-10,2%"
set "DD=%date:~-7,2%"
set "HH=%time:~0,2%"
set "MIN=%time:~3,2%"

REM Replace spaces in the time with zeros to ensure valid file naming
if "%HH:~0,1%"==" " set "HH=0%HH:~1%"
if "%MIN:~0,1%"==" " set "MIN=0%MIN:~1%"

REM Set the source and destination paths
set "SEVENZIP=C:\Program Files\7-zip\7z.exe"
set "SOURCE=D:\premier\"
set "DESTINATION=D:\backup\premier-fs-%YYYY%-%MM%-%DD%-%HH%-%MIN%"
set "LOGFILE=logs\log-%YYYY%-%MM%-%DD%-%HH%-%MIN%.txt"
set "TARFILE=D:\backup\*.tar"
set "NAS=\\kush\Backup\Premier\"

REM Create the zip archive
"%SEVENZIP%" a -ttar -ssw -bb3 "%DESTINATION%" "%SOURCE%" >"%LOGFILE%" 2>&1

echo Removing work files...
move "%TARFILE%" "%NAS%"

endlocal
