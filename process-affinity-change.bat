@echo off

:vars
set process=notepad++

powershell "ForEach($PROCESS in GET-PROCESS %process%) { $PROCESS.ProcessorAffinity=1}"

pause