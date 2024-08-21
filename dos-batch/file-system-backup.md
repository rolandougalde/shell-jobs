# File system backup

This is DOS bacth script, that uses 7zip, for an *open-file* backup.

```batch
@echo off
echo .:Accounting - File Backup:.
echo Modified: 2024-08-21 - By Rolo.
echo ServerName: [server]
echo Archives accounting files and move them to the NAS.
echo.
echo    ___   ___
echo   /  _   _  \
echo     / ^\ / ^\
echo    ^|   ^|   ^|    ^|\
echo    ^|O  ^|O  ^|___/  ^\     ++
echo     \_/ \_/    \   ^| ++
echo   _/      __    \  \
echo  (________/ __   ^|_/
echo   (___      /   ^|    ^|\
echo     \     \^|    ^|___/  ^|
echo      \_________      _/   ++++
echo   ++           \    ^|
echo           ++   ^|   /  +++
echo             ++ /__/
echo.
REM Display the current time

echo Start Time: %time%, this process will take around 52 minutes..

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
set "SOURCE=D:\Accounting\"
set "DESTINATION=D:\backup\accounting-fs-%YYYY%-%MM%-%DD%-%HH%-%MIN%"
set "LOGFILE=logs\log-%YYYY%-%MM%-%DD%-%HH%-%MIN%.txt"
set "TARFILE=D:\backup\*.tar"
set "NAS=\\nas\Backup\Accounting\"
REM Create the zip archive
"%SEVENZIP%" a -ttar -ssw -bb3 "%DESTINATION%" "%SOURCE%" >"%LOGFILE%" 2>&1

echo Removing work files...
move "%TARFILE%" "%NAS%"

endlocal
```


