@echo off

:: Write configuration file
echo <Configuration> > WS with Scripts generated.wsb
echo 	<VGpu>Default</VGpu>
echo 	<Networking>Default</Networking>
echo 	<MappedFolders>
echo 		<MappedFolder>
echo 			<HostFolder>C:\Users\%username%\Documents\Windows Sandbox Utils\Scripts</HostFolder>
echo 			<ReadOnly>true</ReadOnly>
echo 		</MappedFolder>
echo 	</MappedFolders>
echo 	<LogonCommand>
echo 		<Command>C:\Users\WDAGUtilityAccount\Desktop\Scripts\[exec-all-found-scripts].bat</Command>
echo 	</LogonCommand>
echo </Configuration>
