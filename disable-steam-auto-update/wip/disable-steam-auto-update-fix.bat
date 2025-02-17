@echo off
SETLOCAL=ENABLEDELAYEDEXPANSION

:: This script disables Steam's auto game update behavior. It changes it so that the games are only updated on launch.

:workspace
	set temporalFilesPath="%temp%\disable-steam-auto-update-script"
	set steamappsAbsolutePath="Z:\Prueba 2"

:staticVars
	set customAutoUpdateLine=	"AutoUpdateBehavior"		"1"
	set autoUpdateField="AutoUpdateBehavior"

:variables
	set verbose=true

:steamWarning
	echo It is recommended to close Steam for the changes to be properly saved.
	echo Not doing so might leave some games with auto update turned on.
	echo Note: if Steam is installed in the OS drive admin elevation is needed.
	pause
	echo.
	echo //////////////////////////////////////////////////////////

:createTemporalFolder
	echo.
	echo Checking if the required temporal folder exists...
	if not exist %temporalFilesPath% (
		echo Creating temporal folder...
		mkdir %temporalFilesPath%
		echo A new temporal folder was created on path: %temporalFilesPath%.
	)
	echo.
	echo //////////////////////////////////////////////////////////
	echo.

:fileProcessing
	echo Processing Steam's configuration files...
	echo.
	echo //////////////////////////////////////////////////////////
	echo.
	
	for %%f in (%steamappsAbsolutePath%\*.acf) do (
		
		:: For every line in the file
		set count=0
		for /f "delims=" %%a in ('type "%%f"') do (
		
			:: Counting number of lines and storing them into memory
			set /a count=!count! + 1
			set line!count!=%%a
			
			:: For every key-value pair of each line
			for /f "tokens=1,2 delims=	" %%i in ("%%a") do (
			
				:: Check if the line contains the game's name
				if %%i=="name" (
					set gameName=%%j
				)
				
				:: Check if the line is the one to be modified
				if %%i==!autoUpdateField! (
					set autoUpdateLineNumber=!count!
				)
			)
		)
		
		pause
		exit
		
		:: Get the game name
		for /f "tokens=1,2 delims=	" %%i in ("!line6!") do (
			set gameName=%%j
			echo %%j
			echo %%i
		)
		
		if !verbose!==true (
			echo Checking !gameName!...
			echo ----------------------------------------------------------
		)
		
		:: Checking if the autoupdate is already disabled
		if not !line21!==!customAutoUpdateLine! (
			
			:: Confirm changes
			echo !gameName! has autoupdate enabled.
			echo The corresponding file is %%f and it needs to be replaced.
			echo Line that will be replaced: !line21!
			choice /C yn /M "Confirm changes?"
			
			:: Check user's decision
			if !errorlevel!==1 (
				
				:: Change the auto update
				set line21=!customAutoUpdateLine!
				
				:: Write the original file with the modified line into a temporal file
				echo !line1!> %temporalFilesPath%\%%~nxf
				for /L %%i in (2, 1, !count!) do (
					echo !line%%i!>> %temporalFilesPath%\%%~nxf
				)
				
				:: Replace the original file with the modified file
				copy "%temporalFilesPath%\%%~nxf" %steamappsAbsolutePath%\%%~nxf
				
				:: Delete temporal file
				pause
				del "%temporalFilesPath%\%%~nxf"
			)
		)
		echo ==========================================================
	)

:cleanup
:: Delete files from temporal folder (in case a previous execution crashed and some temporal files are left)
:: del "%temporalFilesPath%\appmanifest_*.acf"

:end
echo.
echo Script succesfully executed.
echo After new games are installed you have to run this script again.
echo You could consider launching this script manually from time to time
echo Or you could set it to be launched when the system starts ;)
pause