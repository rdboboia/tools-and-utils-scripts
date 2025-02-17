@echo off
SETLOCAL=ENABLEDELAYEDEXPANSION

set temporalFilesPath=Z:
set steamappsRelativePath=Steam\steamapps
echo %steamappsRelativePath%

for %%f in (%steamappsRelativePath%\*.acf) do (
    echo %%~nf
	echo %%~nxf
	echo %%f
	
	copy NUL %temporalFilesPath%\%%~nxf > nul
	set replaceNeeded=false
	set count=0
	for /f "delims=" %%a in (%steamappsRelativePath%\%%~nf.acf) do (
		set /a count=!count! + 1
		
		if !count!==15 (
			echo 	"AutoUpdateBehavior"		"1">> %temporalFilesPath%\%%~nxf
			
			for /f "tokens=1,2" %%i in ("%%a") do (
				if %%j=="0" (
					set replaceNeeded=true
				)
			)
		)else(
			echo %%a>> %temporalFilesPath%\%%~nxf
		)
	)
	
	if !replaceNeeded!==true (
		echo %%f will be replaced.
	)
	
	:: TODO ::::::::::::::::::::::
	:: 	- Remove original files ::
	:: 	- Copy new ones			::
	:: 	- Delete temp files		::
	::::::::::::::::::::::::::::::
)

pause
exit

:: TODO ::
:: Stop using temporal files if not needed, that is, if the auto update is already off.