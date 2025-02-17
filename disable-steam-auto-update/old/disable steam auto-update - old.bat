@echo off
SETLOCAL=ENABLEDELAYEDEXPANSION

:workspace
set temporalFilesPath=Z:
set steamappsRelativePath=Steam\steamapps
echo %steamappsRelativePath%

:temporalVariables
set customLine15=	"AutoUpdateBehavior"		"1"

:fileProcessing
for %%f in (%steamappsRelativePath%\*.acf) do (
    echo %%~nf
	echo %%~nxf
	echo %%f
	
	set replaceNeeded=false
	set count=0
	for /f "delims=" %%a in (%steamappsRelativePath%\%%~nf.acf) do (
		if !count! LSS 16 (
			set /a count=!count! + 1
			set line!count!=%%a
		)
		
		if !count!==16 (
			set /a count=!count! + 1
		
			if not !line15!==!customLine15! (
				set replaceNeeded=true
				
				for /L %%i in (1, 1, 14) do (
					echo !line%%i!>> %temporalFilesPath%\%%~nxf
				)
				
				echo !customLine15!>> %temporalFilesPath%\%%~nxf
				set line15=asdf
			)
		)
		
		if !replaceNeeded!==true (
			echo %%a>> %temporalFilesPath%\%%~nxf
		)
	)
	
	echo !line1!
	echo !line10!
	echo !line15!

	if !replaceNeeded!==true (
		echo %%f need to be replaced.
		choice /C yn /M "Confirm changes?"
		
		if !errorlevel!==1 (
			REM Copy the file
		)
	)
)