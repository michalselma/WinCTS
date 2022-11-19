########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### Windows Update - Recveive Updates for other Microsoft products
# MS Update service behaviour can no longer be modified by registry edits alone. 
# Service modification requires register or unregister/remove the machine using the Windows Update Agent (WUA).
Function UpdateForOtherMsProd-Disable {
	Write-Output "Disable -> [Settings | Update&Security] -> Windows Update | Advanced options | Update options | Receive updates for other Microsoft products"
	If ((New-Object -ComObject Microsoft.Update.ServiceManager).Services | Where-Object { $_.ServiceID -eq "7971f918-a847-4430-9279-4a52d1efe18d"}) {
		(New-Object -ComObject Microsoft.Update.ServiceManager).RemoveService("7971f918-a847-4430-9279-4a52d1efe18d")
		#(New-Object -com "Microsoft.Update.ServiceManager").RemoveService("7971f918-a847-4430-9279-4a52d1efe18d")
	}
	#Try {
	#	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services" -Name "DefaultService"
	#Catch {
	#	Write-Output $_.Exception
	#}
	#Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971F918-A847-4430-9279-4A52D1EFE18D" -Name "RegisteredWithAU" -Value 0
}
Function UpdateForOtherMsProd-Enable {
	Write-Output "Enable -> [Settings | Update&Security] -> Windows Update | Advanced options | Update options | Receive updates for other Microsoft products"
	(New-Object -com "Microsoft.Update.ServiceManager").AddService2("7971f918-a847-4430-9279-4a52d1efe18d",7,"")
	#New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services" -Name "DefaultService" -Value 7971f918-a847-4430-9279-4a52d1efe18d
	#Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971F918-A847-4430-9279-4A52D1EFE18D" -Name "RegisteredWithAU" -Value 1
}

Export-ModuleMember -Function *