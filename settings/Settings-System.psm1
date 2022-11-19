########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### Advanced System Settings - Remote assistance
# 'Get-WindowsCapability -Online' command is addon that removes Quick Assist application
Function RemoteAssistance-Disable {
	Write-Output "Disable -> [Settings | System | About | Advanced system settings] -> Remote -> Remote assistance -> Allow Remote Assistance connections to this computer"
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 0
	netsh advfirewall firewall set rule group="Remote Assistance" new enable=no
	Get-WindowsCapability -Online | Where-Object { $_.Name -like "App.Support.QuickAssist*" } | Remove-WindowsCapability -Online | Out-Null
}
Function RemoteAssistance-Enable {
	Write-Output "Enable -> [Settings | System | About | Advanced system settings] -> Remote -> Remote assistance -> Allow Remote Assistance connections to this computer"
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 1
	netsh advfirewall firewall set rule group="Remote Assistance" new enable=yes
	Get-WindowsCapability -Online | Where-Object { $_.Name -like "App.Support.QuickAssist*" } | Add-WindowsCapability -Online | Out-Null
}

Export-ModuleMember -Function *