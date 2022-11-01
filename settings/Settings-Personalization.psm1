########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### Small taskbar buttons
Function TaskbarSmallIcons-Disable {
	Write-Output "Disable -> [Settings | Personalization] -> Taskbar | Use small taskbar buttons"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons" -ErrorAction SilentlyContinue
}
Function TaskbarSmallIcons-Enable {
	Write-Output "Enable -> [Settings | Personalization] -> Taskbar | Use small taskbar buttons"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons" -Type DWord -Value 1
}

#### Always Show all icons in taskbar
Function ShowAllTrayIcons-Disable {
	Write-Output "Disable -> [Settings | Personalization] -> Taskbar | Notification area | Select which icons appear on the taskbar | Always show all icons in the notification area"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -ErrorAction SilentlyContinue
}
Function ShowAllTrayIcons-Enable {
	Write-Output "Enable -> [Settings | Personalization] -> Taskbar | Notification area | Select which icons appear on the taskbar | Always show all icons in the notification area"
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 0
}

#### Taskbar People icon
Function PeopleIcon-Disable {
	Write-Output "Disable -> [Settings | Personalization] -> Taskbar | People | Show contacts on the taskbar"
	Write-Output "Disable -> [Taskbar | 'Right Click'] -> Show People on the taskbar"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -ErrorAction SilentlyContinue
}
Function PeopleIcon-Enable {
	Write-Output "Enable -> [Settings | Personalization] -> Taskbar | People | Show contacts on the taskbar"
	Write-Output "Enable -> [Taskbar | 'Right Click'] -> Show People on the taskbar"
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 1
}

#### Taskbar 'Search' Mode
#### 0-none, 1-icon, 2-box (default) (Win11 -> default is no registry key-value = icon) 
Function TaskbarSearchIcon-Disable {
	Write-Output "Disable  -> [Taskbar | 'Right Click'] -> Search -> Hidden"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
}
Function TaskbarSearchIcon-Enable {
	Write-Output "Enable  -> [Taskbar | 'Right Click'] -> Search -> Show search Icon (TaskbarSearchBox setting needs to be set to 'Skip')"
	Write-Output "Searchbox Taskbar Mode -> Icon (TaskbarSearchBox setting should be set to 'Skip'"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 1
}
Function TaskbarSearchBox-Disable{
	Write-Output "Disable  -> [Taskbar | 'Right Click'] -> Search -> Hidden"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
}
Function TaskbarSearchBox-Enable {
	Write-Output "Enable  -> [Taskbar | 'Right Click'] -> Search -> Show search box (TaskbarSearchIcon setting needs to be set to 'Skip')"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 2
}

#### Task View Button
Function ShowTaskViewButton-Disable {
	Write-Output "Disable -> [Taskbar | 'Right Click'] -> ShowTaskViewButton"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
}
Function ShowTaskViewButton-Enable {
	Write-Output "Enable -> [Taskbar | 'Right Click'] -> ShowTaskViewButton"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -ErrorAction SilentlyContinue
}

Export-ModuleMember -Function *