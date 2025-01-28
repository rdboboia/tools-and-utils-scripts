$vm = "Hyper-V - W11 - Pers"
if (Get-VMGpuPartitionAdapter -VMName $vm -ErrorAction SilentlyContinue) {
	Remove-VMGpuPartitionAdapter -VMName $vm
}
Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -LowMemoryMappedIoSpace 1Gb -VMName $vm
Set-VM -HighMemoryMappedIoSpace 32GB -VMName $vm
Add-VMGpuPartitionAdapter -VMName $vm