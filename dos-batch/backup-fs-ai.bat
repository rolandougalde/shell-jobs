@echo off
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
set "DESTINATION=D:\backup\premier-files-%YYYY%-%MM%-%DD%-%HH%-%MIN%.zip"
set "LOGFILE=\logs\log-%YYYY%-%MM%-%DD%-%HH%-%MIN%.txt"

REM Create the zip archive
"%SEVENZIP%" a -tzip -ssw -bb3 "%DESTINATION%" "%SOURCE%" >"%LOGFILE%" 2>&1

endlocal
