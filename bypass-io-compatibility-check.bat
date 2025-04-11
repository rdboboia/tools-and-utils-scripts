@echo off

echo WARNING! This scripts requires admin privileges.

fsutil bypassIo state C:\

echo.
echo -----------------------------------------------
echo If a driver error is raised try uninstalling your specific NVME driver.
echo Seems like the Windows standard NVME driver is required, at least for older NVMEs.

pause
