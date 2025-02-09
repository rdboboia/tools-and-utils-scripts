@echo off

:vars
set tempPowerShellScriptName=check-if-system-is-vm.ps1
set tempPowerShellScriptFullPath=%temp%\%tempPowerShellScriptName%

:createPowerShellScript
echo $systemModel = (Get-WmiObject -Class Win32_ComputerSystem).Model	> %tempPowerShellScriptFullPath%
echo if ($systemModel -match "Virtual|VMware|Hyper-V") {				>> %tempPowerShellScriptFullPath%
echo     Write-Output "VM"												>> %tempPowerShellScriptFullPath%
echo } else {															>> %tempPowerShellScriptFullPath%
echo     Write-Output "HOST"											>> %tempPowerShellScriptFullPath%
echo }																	>> %tempPowerShellScriptFullPath%

:executeScriptAndRetrieveValue
for /f "delims=" %%a in ('powershell -ExecutionPolicy Bypass -file "%tempPowerShellScriptFullPath%"') do (
	set vmCheckerReturnValue=%%a
)

:deleteScript
del %tempPowerShellScriptFullPath%

:printValue
echo %vmCheckerReturnValue%

:end
pause