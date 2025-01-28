@echo off

:: Changes the default admin priviledges prompt to ask for the password instead of just asking for yes/no permission ::

:: Set title ::
title "Configure windows admin elevation prompt"

:: Changes the registry to ask for password on admin privilege prompt ::
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 1 /f

:: Microsoft documentation: https://learn.microsoft.com/es-es/openspecs/windows_protocols/ms-gpsb/341747f5-6b5d-4d30-85fc-fa1cc04038d4
:: 0x00000000 - This option allows the Consent Admin to perform an operation that requires elevation without consent or credentials.
:: 0x00000001 - This option prompts the Consent Admin to enter his or her user name and password (or another valid admin) when an operation requires elevation of privilege. This operation occurs on the secure desktop.
:: 0x00000002 - This option prompts the administrator in Admin Approval Mode to select either "Permit" or "Deny" an operation that requires elevation of privilege. If the Consent Admin selects Permit, the operation will continue with the highest available privilege. "Prompt for consent" removes the inconvenience of requiring that users enter their name and password to perform a privileged task. This operation occurs on the secure desktop.
:: 0x00000003 - This option prompts the Consent Admin to enter his or her user name and password (or that of another valid admin) when an operation requires elevation of privilege.
:: 0x00000004 - This prompts the administrator in Admin Approval Mode to select either "Permit" or "Deny" an operation that requires elevation of privilege. If the Consent Admin selects Permit, the operation will continue with the highest available privilege. "Prompt for consent" removes the inconvenience of requiring that users enter their name and password to perform a privileged task.
:: 0x00000005 - This option is the default. It is used to prompt the administrator in Admin Approval Mode to select either "Permit" or "Deny" for an operation that requires elevation of privilege for any non-Windows binaries. If the Consent Admin selects Permit, the operation will continue with the highest available privilege. This operation will happen on the secure desktop.