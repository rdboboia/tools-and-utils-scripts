:: Enables numlock ON by default (useful for Hyper-V VMs) ::

:: Set title and banner ::
call %utilsPath%\set-title-and-banner "Configure windows admin elevation prompt"

:: Changes the registry to ask for password on admin privilege prompt ::
reg add "HKU\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f
reg add "HKCU\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f

:: Requires restart ::
call %utilsPath%\restart-manager