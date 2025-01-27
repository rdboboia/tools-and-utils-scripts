@echo off

:: Mask is performed in binary; lower bits are lower CPU core numbers ::
:: Examples:
:: 		- 8 cores
::			+ 1000 0000 (bit mask) = 128 (decimal value for the processor affinity) = last core
::			+ 0000 0001 (bit mask) = 1 (decimal value for the processor affinity) = first core
::			+ 0000 0011 (bit mask) = 3 (decimal value for the processor affinity) = first 2 cores
:vars
::last 4 cores on a 16 thread CPU
::set systemAffinity=61440
:: All cores on a 16 thread CPU
set systemAffinity=65535
set steamAffinity=65520

powershell "ForEach($PROCESS in GET-PROCESS) { $PROCESS.ProcessorAffinity=%systemAffinity%}"

:: powershell "ForEach($PROCESS in GET-PROCESS steam) { $PROCESS.ProcessorAffinity=%steamAffinity%}"
:: powershell "ForEach($PROCESS in GET-PROCESS steamservice) { $PROCESS.ProcessorAffinity=%steamAffinity%}"
::  powershell "ForEach($PROCESS in GET-PROCESS steamwebhelper) { $PROCESS.ProcessorAffinity=%steamAffinity%}"

pause