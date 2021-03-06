####SSH Toggler1.1####
#MrAmbig
#Enable or disable SSH on all hosts of a vcenter
#changelog from version 1 
#It repeats the prompt unless you exit & without the need of entering the variables again
#http://ambitech.blogspot.in/2015/05/ssh-toggler-for-vmware-hosts.html
###################

#variables
$VCuser = Read-Host "Type the vCenter Server's Username"
$VCpass = Read-Host "Type the vCenter Server's password"
$VCaddress = Read-Host "Type the vCenter Server's address"

#connect to the vcenter server
connect-viserver -Server $VCaddress -User $VCuser -Password $VCpass

 do {

#SSH Menu
Write-Host "Select the options below"
Write-Host "1.Enable SSH on all hosts"
Write-Host "2.Disable SSH on all hosts"
Write-Host "3.Quit and exit"
$option = Read-Host "Select 1-3"

switch ($option)
{
1
 {Get-VMHost | Get-VMHostService | where {$_.Key -eq "TSM-SSH"} | Start-VMHostService}
2
 {Get-VMHost | Get-VMHostService | where {$_.Key -eq "TSM-SSH"} | Stop-VMHostService}
3
 {Disconnect-VIServer -Server * -Force} 
}

}

while ($option -ne "3")
