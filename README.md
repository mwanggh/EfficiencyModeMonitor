# Efficiency Mode Monitor

This PowerShell script monitors specific programs' processes on your Windows system. Many people experience browser lag when running in efficiency mode. This program can help alleviate that issue. If any process is found running with an **Idle** priority, the script adjusts its priority to **Normal** and logs the event in a log file.

## Features

- **Real-time Process Monitoring**: Continuously monitors specific programs' processes.
- **Automatic Priority Adjustment**: Changes process priority from `Idle` to `Normal` automatically.
- **Logging**: Logs process details (timestamp, program name, PID, and window title) to a file for review.
