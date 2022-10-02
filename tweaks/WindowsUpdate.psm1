#### Allow Update For Other Microsoft Products
Function DisableAllowUpdateForOtherMicrosoftProducts {
	Write-Output "Settings|Update & Security|Windows Update|Advanced Options|Allow Update For Other Microsoft Products -> Disable"
	(New-Object -com "Microsoft.Update.ServiceManager").RemoveService("7971f918-a847-4430-9279-4a52d1efe18d") | Out-Null
	# MS Update service can no longer be performed by registry edits alone.
	# To disable this service unregister/remove the machine using the Windows Update Agent (WUA).
	# Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services" -Name "DefaultService"
	# Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971F918-A847-4430-9279-4A52D1EFE18D" -Name "RegisteredWithAU" -Value 0
}

Function EnableAllowUpdateForOtherMicrosoftProducts {
	Write-Output "Settings|Update & Security|Windows Update|Advanced Options|Allow Update For Other Microsoft Products -> Enable"
	(New-Object -com "Microsoft.Update.ServiceManager").AddService2("7971f918-a847-4430-9279-4a52d1efe18d",7,"") | Out-Null
	# MS Update service can no longer be performed by registry edits alone. 
	# To enable this service register the machine using the Windows Update Agent (WUA).
	# New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services" -Name "DefaultService" -Value 7971f918-a847-4430-9279-4a52d1efe18d
	# Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971F918-A847-4430-9279-4A52D1EFE18D" -Name "RegisteredWithAU" -Value 1
}

# Export functions
Export-ModuleMember -Function *