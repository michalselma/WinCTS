########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### Notifications & actions - suggestions at startup
Function AppSuggestionsGetEvenMoreOutOfWindows-Disable {
	Write-Output "Disable -> [Settings | System | Notifications & actions] -> Notifications -> Suggest ways I can finish setting up my device to get the most out of Windows"
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Force
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Name "ScoobeSystemSettingEnabled" -Type DWord -Value 0
}
Function AppSuggestionsGetEvenMoreOutOfWindows-Enable {
	Write-Output "Enable -> [Settings | System | Notifications & actions] -> Notifications -> Suggest ways I can finish setting up my device to get the most out of Windows"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" -Name "ScoobeSystemSettingEnabled"
}

#### Advanced System Settings - Remote assistance
# 'Get-WindowsCapability -Online' command is addon that removes Quick Assist application
Function RemoteAssistance-Disable {
	Write-Output "Disable -> [Settings | System | About | Advanced system settings] -> Remote -> Remote assistance -> Allow Remote Assistance connections to this computer"
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 0
	netsh advfirewall firewall set rule group="Remote Assistance" new enable=no
	Get-WindowsCapability -Online | Where-Object { $_.Name -like "App.Support.QuickAssist*" } | Remove-WindowsCapability -Online
}
Function RemoteAssistance-Enable {
	Write-Output "Enable -> [Settings | System | About | Advanced system settings] -> Remote -> Remote assistance -> Allow Remote Assistance connections to this computer"
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 1
	netsh advfirewall firewall set rule group="Remote Assistance" new enable=yes
	Get-WindowsCapability -Online | Where-Object { $_.Name -like "App.Support.QuickAssist*" } | Add-WindowsCapability -Online
}

Export-ModuleMember -Function *