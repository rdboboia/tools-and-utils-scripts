:: This script disables the WIN+R shortcut to the Windows program runner.

:: Disable command echo.
@echo off

:: Set title ::
title "Disable WIN + R runner shortcut"

:: Changes the registry to apply the changes.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRun /t REG_DWORD /d 1 /f

:: Restart required.
echo Restar required to apply changes. Please restart your computer now.
pause