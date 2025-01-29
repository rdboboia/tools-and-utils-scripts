@echo off

:: Enable support for 60 FPS in Hyper-V VM ::
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations" /v DWMFRAMEINTERVAL /t REG_DWORD /d 10 /f

:: Restart required ::
echo Restart required!
echo Restart manually when desired or press any key to schedule a restart now.
pause
shutdown /r /t 5