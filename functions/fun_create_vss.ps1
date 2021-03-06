<#
.SYNOPSIS
    create vSwitchs on all vmware esxi hosts.
.DESCRIPTION
    This will create vswitchs on all of your hosts of a vcenter
.NOTES
    File Name      : fun_create_vss.ps1
    Author         : gajendra d ambi
    Date           : 2015
    Prerequisite   : PowerShell v4+, powercli 6+ over win7 and upper.
    Copyright      - None
.LINK
    Script posted over: github.com/gajuambi/vmware
    
#>

#start of  script
#start of function
function fun_create_vss {
write-host "type * if you want this to be performed on all hosts of all clusters 
or 
else type the name of the cluster to perform agaist just one cluster" -ForegroundColor DarkYellow
$cluster = read-host "name of the cluster?"
$vss     = read-host "name of the vSwitch?"
write-host "recommended MTU values are 1500 or 9000, 1500 is the default" -ForegroundColor Yellow
$mtu     = read-host "MTU?"
write-host "provide multiple vmnics separated by comma" -ForegroundColor DarkYellow
$vmnic   = Read-Host ":"
Get-Cluster $cluster | get-vmhost | New-VirtualSwitch -Name $vss -Mtu $mtu -Confirm:$false
Get-cluster $cluster | get-vmhost | get-virtualswitch -Name $vss | Set-VirtualSwitch -Nic $vmnic -Confirm:$false
}
#end of function
fun_create_vss
#End of script

