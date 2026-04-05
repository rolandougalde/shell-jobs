# Get installation date (first boot after install):
Get-CimInstance Win32_OperatingSystem | Select-Object InstallDate

# Get last boot time (not first):
Get-CimInstance Win32_OperatingSystem | Select-Object LastBootUpTime
