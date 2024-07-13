@echo off
setlocal enabledelayedexpansion

:: Define the username to filter logon events
set "username=specific_user"

:: Define the start and end dates for filtering (format: YYYY-MM-DD)
set "startdate=2023-01-01"
set "enddate=2023-12-31"

:: Define the log file to store intermediate results
set "logfile=logon_events.txt"

:: Function to convert date to YYYYMMDD format for comparison
call :convertDate %startdate% startdate
call :convertDate %enddate% enddate

:: Query the Security log for logon events (ID 4624) and save to log file
wevtutil qe Security /q:"*[System[(EventID=4624)]]" /f:text > "%logfile%"

:: Initialize variables
set "isTargetEvent=false"
set "eventDate="

:: Read the log file and filter events for the specific user and date range
for /f "tokens=*" %%A in (%logfile%) do (
    set "line=%%A"
    
    :: Check if the line contains a date
    echo !line! | findstr /r /c:"^Date:" >nul
    if !errorlevel! == 0 (
        for /f "tokens=2 delims=: " %%B in ("!line!") do set "eventDate=%%B"
        call :convertDate !eventDate! eventDate
        if !eventDate! GEQ !startdate! if !eventDate! LEQ !enddate! (
            set "isTargetEvent=true"
        ) else (
            set "isTargetEvent=false"
        )
    )

    :: Check if the line contains the specific username within the target date range
    if !isTargetEvent! == true (
        echo !line! | findstr /i /c:"Account Name:            %username%" >nul
        if !errorlevel! == 0 (
            echo !line!
        )
    )
)

:: Clean up
del "%logfile%"

endlocal
exit /b

:convertDate
setlocal
set "dateStr=%~1"
:: Convert date from YYYY-MM-DD to YYYYMMDD
set "dateStr=%dateStr:-=%"
endlocal & set "%~2=%dateStr%"
exit /b
