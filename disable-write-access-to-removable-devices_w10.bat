:::::::::::::::::::::::::::::::::::::::::::
:: Disable external devices write access ::
:::::::::::::::::::::::::::::::::::::::::::

:: Disable command echo.
@echo off

:: Set title ::
title "Disable USB write access"

:: Possible values:
:: 		Value 0 - Don't deny writting
:: 		Value 1 - Deny writting

:: Changes registry to apply changes.
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b} /v Deny_Write /t REG_DWORD /d 1 /f

:: No restart required.