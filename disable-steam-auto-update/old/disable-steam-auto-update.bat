@echo off
SETLOCAL=ENABLEDELAYEDEXPANSION

:: This script disables Steam's auto game update behavior. It changes it so that the games are only updated on launch.

:workspace
	set temporalFilesPath="%temp%\disable-steam-auto-update-script"
	set steamappsAbsolutePath="D:\SteamLibrary\steamapps"

:customLineVariables
	set customAutoUpdateLine=	"AutoUpdateBehavior"		"1"

:steamWarning
	echo It is recommended to close Steam for the changes to be properly saved.
	echo Not doing so might leave some games with auto update turned on.
	echo Note: if Steam is installed in the OS drive admin elevation is needed.
	pause

:createTemporalFolder
	echo.
	echo Checking if the required temporal folder exists...
	if not exist %temporalFilesPath% (
		echo Creating temporal folder...
		mkdir %temporalFilesPath%
		echo A new temporal folder was created on path: %temporalFilesPath%.
	)

:fileProcessing
	echo.
	echo Processing Steam's configuration files...
	for %%f in (%steamappsAbsolutePath%\*.acf) do (
		
		:: Counting number of lines and storing them into memory
		set count=0
		for /f "delims=" %%a in (%%f) do (
			set /a count=!count! + 1
			set line!count!=%%a
		)

		:: Checking if the autoupdate is already disabled
		if not !line18!==!customAutoUpdateLine! (
			
			:: Get the game name
			for /f "tokens=1,2 delims=	" %%i in ("!line6!") do (
				set gameName=%%j
			)
			
			echo.
			echo ----------------------------------------------------------
			
			:: Confirm changes
			echo !gameName! has autoupdate enabled.
			echo The corresponding file is %%f and it needs to be replaced.
			choice /C yn /M "Confirm changes?"
			
			:: Check user's decision
			if !errorlevel!==1 (
				
				:: Change the auto update
				set line18=!customAutoUpdateLine!
				
				:: Write the original file with the modified line into a temporal file
				echo !line1!> %temporalFilesPath%\%%~nxf
				for /L %%i in (2, 1, !count!) do (
					echo !line%%i!>> %temporalFilesPath%\%%~nxf
				)
				
				:: Replace the original file with the modified file
				copy "%temporalFilesPath%\%%~nxf" "%steamappsAbsolutePath%\%%~nxf"
			)
		)
	)

:end
echo.
echo Script succesfully executed.
echo After new games are installed you have to run this script again.
echo You could consider launching this script manually from time to time
echo Or you could set it to be launched when the system starts ;)
pause