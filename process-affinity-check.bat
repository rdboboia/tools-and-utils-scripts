@echo off

powershell.exe "Get-Process notepad++ | Select-Object ProcessorAffinity"

pause