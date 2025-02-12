:: System health check

:: Requires ADMIN

:: This command removes old, unused versions of Windows Update files and components, which can free up space and prepare the system for repair operations.
:: It ensures your component store is in good shape before proceeding with deeper repairs.
dism /online /cleanup-image /startcomponentcleanup

:: This command scans the component store for corruption and repairs it by downloading fresh files from Windows Update or a specified source.
:: It's essential to fix any issues in the component store that might cause problems for the System File Checker (SFC).
dism /online /cleanup-image /restorehealth

:: This command checks the integrity of system files and replaces any corrupt files with the correct version, using the component store repaired by the previous command.
:: Running it last ensures it has access to a clean component store.
sfc /scannow

pause
exit