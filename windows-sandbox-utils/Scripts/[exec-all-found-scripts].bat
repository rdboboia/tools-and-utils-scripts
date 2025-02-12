@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION

SET scriptFolderPath="C:\Users\WDAGUtilityAccount\Desktop\Scripts"

FOR %%f IN (%scriptFolderPath%\scripts-pack\*) DO (
	ECHO Found script: %%f
	ECHO Calling %%f...
	ECHO ----------------------------------------------------------------------
	CALL %%f
	ECHO ======================================================================
)

IF %restartRequired%==1 (
	ECHO Some settings need a restart to be applied.
	ECHO Close this window to restart manually later.
	ECHO Press any key to schedule a restart now.
	PAUSE > NUL
)