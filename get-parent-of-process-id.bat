@echo off
setlocal enabledelayedexpansion

:loadArgs
set args=%~1

:vars
if "%args%"=="" (
	set /p processId=Proces ID to analyze: 
) else (
	set processId=%args%
)

:intro
echo ==========================================================================
echo Listing process tree:
echo ---------------------

:loop
set index=0
for /f "delims=" %%a in ('powershell -command "Get-CimInstance -className win32_process | where-object {$_.ProcessId -eq %processId% } | select ProcessId, Name, ParentProcessId"') do (
	set /a index+=1
	
	if !index!==3 (
		set line=%%a
		goto extractParentId
	)
)

:extractParentId
set index=0
set currentProcessName=PLACEHOLDER
for %%b in (%line%) do (
	set /a index+=1
	
	if !index!==2 (
		set currentProcessName=%%b
	)
	
	if !index!==3 (
	
		if %%b==%processId% (
			goto end
		) else (
			set processId=%%b
			
			echo !currentProcessName!
			:: echo Parent process ID: %%b
			goto loop
		)
	)
)

:end
endlocal
echo ==========================================================================
pause
cls