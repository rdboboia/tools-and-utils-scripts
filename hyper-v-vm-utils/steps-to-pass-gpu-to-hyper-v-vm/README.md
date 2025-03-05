# Scripts
- Edit the VM name in the script to match the desired VM
- Execute all commnads at once in powershell as admin

# Drivers
- Mount the virtual disk in windows (it can me tricky sometimes; check disk manager if you get an error about the disk being in use; it might already be mounted but with no assigned letter).
- Go to C:\Windows\System32\DriverStore\FileRepository and locate your GPU's drivers (or copy the entire "FileRepository" folder)
	+ In my case for NVidia I copied the following folders:
		* nv_dispi.inf_amd64_9425e4c3b1ac1c47
- In the mounted VM's disk go to C:\Windows\System32\HostDriverStore\FileRepository and paste the GPU drivers (or the entire "FileRepository" folder content, which is all the drivers)