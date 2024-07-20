@echo off

:: Open five websites
start "" "https://www.google.com"
start "" "https://www.github.com"
start "" "https://www.stackoverflow.com"
start "" "https://www.microsoft.com"
start "" "https://www.reddit.com"

:: Launch Calculator
start calc

:: Launch Notepad
start notepad

:: Wait for 1 minute before shutdown
echo Your system will shut down in 1 minute. Save your work.
timeout /t 60

:: Initiate system shutdown
shutdown /s /t 0

exit /b
