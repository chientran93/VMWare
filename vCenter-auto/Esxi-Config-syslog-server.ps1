# Get all ESXi hosts
$ESXI_HOSTS = Get-VMHost

# Loop through each ESXi host and update global syslog settings
foreach ($ESXI_HOST in $ESXI_HOSTS) {
    Write-Host "Updating global syslog settings for ESXi host $($ESXI_HOST.Name)..."

    # Change global syslog host with UDP protocol
    Set-VMHostAdvancedConfiguration -VMHost $ESXI_HOST -Name "Syslog.global.logHost" -Value "udp://192.168.99.250:514" -Confirm:$false
}

# Disconnect from vCenter server
Disconnect-VIServer -Server $VCENTER_SERVER -Force

Write-Host "Global syslog settings updated for all ESXi hosts."
