# Define the list of programs to monitor
$programs = @{
    "Chrome" = "chrome"
    "VSCode" = "Code"
}

# Log file path (create in the script's directory)
$logFile = Join-Path -Path $PSScriptRoot -ChildPath "ProcessMonitor.log"

# Overwrite log file at the start
Set-Content -Path $logFile -Value ""

# Infinite loop to monitor processes
while ($true) {
    foreach ($program in $programs.GetEnumerator()) {
        # Get all processes for the current program
        $processes = Get-Process -Name $program.Value -ErrorAction SilentlyContinue

        foreach ($process in $processes) {
            # Check if the process has not exited and its priority is Idle
            if (-not $process.HasExited -and $process.PriorityClass -eq [System.Diagnostics.ProcessPriorityClass]::Idle) {
                
                # Change the process priority to Normal
                $process.PriorityClass = [System.Diagnostics.ProcessPriorityClass]::Normal

                # Log process information to the log file
                $logMessage = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $($program.Key) (PID: $($process.Id)) $($process.MainWindowTitle)"
                Add-Content -Path $logFile -Value $logMessage
            }
        }
    }

    # Sleep for 0.5 seconds before the next check
    Start-Sleep -Milliseconds 500
}