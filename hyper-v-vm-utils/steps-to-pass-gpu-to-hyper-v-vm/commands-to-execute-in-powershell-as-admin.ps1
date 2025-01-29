# Configure the VM for a Discrete Device Assignment
$vm = "Hyper-V - W11 - Pers"

if (Get-VMGpuPartitionAdapter -VMName $vm -ErrorAction SilentlyContinue) {
	Remove-VMGpuPartitionAdapter -VMName $vm
}
# Enable Write-Combining on the CPU
Set-VM -GuestControlledCacheTypes $true -VMName $vm

# Configure 32 bit MMIO space
Set-VM -LowMemoryMappedIoSpace 1Gb -VMName $vm

# Configure Greater than 32 bit MMIO space
Set-VM -HighMemoryMappedIoSpace 32GB -VMName $vm

# Enable use of the GPU to the VM
Add-VMGpuPartitionAdapter -VMName $vm