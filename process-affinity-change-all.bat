@echo off

:: Mask is performed in binary; lower bits are lower CPU core numbers ::
:: Examples:
:: 		- 8 cores
::			+ 1000 0000 (bit mask) = 128 (decimal value for the processor affinity) = last core
::			+ 0000 0001 (bit mask) = 1 (decimal value for the processor affinity) = first core
::			+ 0000 0011 (bit mask) = 3 (decimal value for the processor affinity) = first 2 cores
:vars
set affinityBitMask=1

powershell "ForEach($PROCESS in GET-PROCESS) { $PROCESS.ProcessorAffinity=%affinityBitMask%}"

pause