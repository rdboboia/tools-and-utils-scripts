@echo off

:: In Windows 10 and previous Windows version the WMIC could be used to retrieve the Serial Number of your PC.
:: However, in Windows 11 WMIC is being deprecated and is not installed nor enabled by default.
:: This is the new way that I found to retrieve the Serial Number in Windows 11.

powershell -ExecutionPolicy Bypass "Get-WmiObject win32_bios | select Serialnumber"

for /f "delims=" %%a in ('powershell -ExecutionPolicy Bypass "Get-WmiObject win32_bios | select Serialnumber"') do (
	set serialNumber=%%a
)

:: echo %serialNumber%
pause