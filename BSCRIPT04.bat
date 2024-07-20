@echo off
setlocal enabledelayedexpansion


set sourceDir=C:\*.txt
set archiveDir=G:\ArchivedFiles
set tempDir=%archiveDir%\temp

:: Create necessary directories if they do not exist
if not exist %archiveDir% mkdir %archiveDir%
if not exist %tempDir% mkdir %tempDir%

echo Sorting text files on Drive C: by date and archiving older files...


forfiles /p C:\ /m *.txt /d -30 /c "cmd /c move @path %archiveDir%\"


if not exist %archiveDir%\*.txt (
    echo No files to archive.
    pause
    goto end
)


echo Sorting archived files by size...
(for %%f in (%archiveDir%\*.txt) do (
    set "size=%%~zf"
    set "file=%%f"
    echo !size! !file!
)) | sort /r /+1 > %tempDir%\sorted_files.txt


if not exist %tempDir%\sorted_files.txt (
    echo No files to sort by size.
    pause
    goto end
)


echo Files in the archive sorted by size:
type %tempDir%\sorted_files.txt

set /p deletePrompt=Do you want to delete the old, large files? (Y/N): 
if /I "%deletePrompt%"=="Y" (
    for /F "tokens=2*" %%a in (%tempDir%\sorted_files.txt) do del "%%b"
    echo Old, large files deleted.
) else (
    echo Deletion canceled.
)


rd /s /q %tempDir%

:end
echo.
echo Script completed.
pause
exit /b
