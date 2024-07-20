@echo off
setlocal enabledelayedexpansion

:menu
cls
echo.
echo Select a Windows utility to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format (Disabled for safety)
echo 6. defrag
echo 7. find
echo 8. attrib
echo 9. Exit
set /p choice=Enter your choice (1-9): 

if %choice%==1 goto ipconfig
if %choice%==2 goto tasklist
if %choice%==3 goto taskkill
if %choice%==4 goto chkdsk
if %choice%==5 goto format_disabled
if %choice%==6 goto defrag
if %choice%==7 goto find
if %choice%==8 goto attrib
if %choice%==9 goto end
echo Invalid choice. Please select a number between 1 and 9.
pause
goto menu

:ipconfig
ipconfig
pause
goto menu

:tasklist
tasklist
pause
goto menu

:taskkill
set /p pid=Enter the PID or name of the process to kill: 
taskkill /PID %pid% /F
if %errorlevel% neq 0 echo Failed to kill process. Please check the PID or name.
pause
goto menu

:chkdsk
set /p drive=Enter the drive letter (e.g., C:): 
chkdsk %drive%
pause
goto menu

:format_disabled
echo Format command is disabled for safety.
pause
goto menu

:defrag
set /p drive=Enter the drive letter to defrag (e.g., C:): 
defrag %drive%
pause
goto menu

:find
set /p string=Enter the string to find: 
set /p file=Enter the file to search in: 
find "%string%" %file%
if %errorlevel% neq 0 echo String not found.
pause
goto menu

:attrib
set /p file=Enter the file or directory to change attributes: 
set /p attributes=Enter the attributes to set (e.g., +r -h): 
attrib %attributes% %file%
if %errorlevel% neq 0 echo Failed to change attributes. Please check the file and attributes.
pause
goto menu

:end
echo.
echo Exiting the script. Goodbye!
pause
exit /b
