# This script was tested deleting web server multiple files
# Set the root directory where the search will begin
# Check the PS execution policy: "Get-Executionpolicy", if "Restricted" issue "Set-Executionpolicy Unrestricted".

$rootDirectory = "C:\inetpub\logs"

# Function to recursively delete *.log files in subdirectories
function DeleteLogFilesRecursively($directory) {
    # Get all *.log files in the current directory
    $logFiles = Get-ChildItem -Path $directory -Filter "*.log" -File

    # Delete each *.log file found
    foreach ($logFile in $logFiles) {
        $logFilePath = $logFile.FullName
        Remove-Item $logFilePath -Force
        Write-Host "Deleted: $logFilePath"
    }

    # Recursively search and delete in subdirectories
    $subDirectories = Get-ChildItem -Path $directory -Directory
    foreach ($subDir in $subDirectories) {
        DeleteLogFilesRecursively $subDir.FullName
    }
}

# Start the recursive search and deletion process
DeleteLogFilesRecursively $rootDirectory
