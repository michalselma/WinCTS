########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### Start - Recently Added Apps
Function ShowRecentlyAddedApps-Disable {
	Write-Output "Disable -> [Settings | Personalization] -> Start | Show recently added apps"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function ShowRecentlyAddedApps-Enable {
	Write-Output "Enable -> [Settings | Personalization] -> Start | Show recently added apps"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Start - Show most used apps
# This option can be "grey out" by disabling:
# [Settings | Privacy] -> Windows permisions | General | Let Windows track app launches to improve Start and search results
Function ShowMostUsedApps-Disable {
	Write-Output "Disable -> [Settings | Personalization] -> Start | Show most used apps"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function ShowMostUsedApps-Enable {
	Write-Output "Enable -> [Settings | Personalization] -> Start | Show most used apps"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Start - Show recently opened items
# Recent items and frequent places are stored in the folder locations below.
# %APPDATA%\Microsoft\Windows\Recent Items
# %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations
# %APPDATA%\Microsoft\Windows\Recent\CustomDestinations
#
# c:\Users\xxxxx\AppData\Roaming\Microsoft\Windows\Recent\
# c:\Users\xxxxx\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations
# c:\Users\xxxxx\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations
# TO DO: Add cleanup activity of above locations
Function ShowRecentlyOpenedItems-Disable {
	Write-Output "Disable -> [Settings | Personalization] -> Start | Show recently opened items in Jump Lists on Start or the taskbar and in File Explorer Quick Access"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackDocs" -Type DWord -Value 0
}
Function ShowRecentlyOpenedItems-Enable {
	Write-Output "Enable -> [Settings | Personalization] -> Start | Show recently opened items in Jump Lists on Start or the taskbar and in File Explorer Quick Access"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackDocs" -Type DWord -Value 1
}

#### Taskbar - Small taskbar buttons
Function TaskbarSmallIcons-Disable {
	Write-Output "Disable -> [Settings | Personalization] -> Taskbar | Use small taskbar buttons"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons"
}
Function TaskbarSmallIcons-Enable {
	Write-Output "Enable -> [Settings | Personalization] -> Taskbar | Use small taskbar buttons"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons" -Type DWord -Value 1
}

#### Taskbar - Always Show all icons in taskbar
Function ShowAllTrayIcons-Disable {
	Write-Output "Disable -> [Settings | Personalization] -> Taskbar | Notification area | Select which icons appear on the taskbar | Always show all icons in the notification area"	
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray"
}
Function ShowAllTrayIcons-Enable {
	Write-Output "Enable -> [Settings | Personalization] -> Taskbar | Notification area | Select which icons appear on the taskbar | Always show all icons in the notification area"
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer"
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 0
}

#### Taskbar - People icon
# Also configurable via [Taskbar | 'Right Click'] -> Show People on the taskbar
Function PeopleIcon-Disable {
	Write-Output "Disable -> [Settings | Personalization] -> Taskbar | People | Show contacts on the taskbar"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand"
}
Function PeopleIcon-Enable {
	Write-Output "Enable -> [Settings | Personalization] -> Taskbar | People | Show contacts on the taskbar"
	Write-Output "Enable -> [Taskbar | 'Right Click'] -> Show People on the taskbar"
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 1
}

#### Taskbar - Taskbar 'Search' Mode
#### 0-none, 1-icon, 2-box (default) (Win11 -> default is no registry key-value = icon) 
Function TaskbarSearchIcon-Disable {
	Write-Output "Disable -> [Taskbar | 'Right Click'] -> Search -> Hidden"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
}
Function TaskbarSearchIcon-Enable {
	Write-Output "Enable -> [Taskbar | 'Right Click'] -> Search -> Show search Icon (TaskbarSearchBox setting needs to be set to 'Skip')"
	Write-Output "Searchbox Taskbar Mode -> Icon (TaskbarSearchBox setting should be set to 'Skip'"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 1
}
Function TaskbarSearchBox-Disable{
	Write-Output "Disable -> [Taskbar | 'Right Click'] -> Search -> Hidden"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
}
Function TaskbarSearchBox-Enable {
	Write-Output "Enable -> [Taskbar | 'Right Click'] -> Search -> Show search box (TaskbarSearchIcon setting needs to be set to 'Skip')"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 2
}

#### Taskbar - Task View Button
Function ShowTaskViewButton-Disable {
	Write-Output "Disable -> [Taskbar | 'Right Click'] -> ShowTaskViewButton"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
}
Function ShowTaskViewButton-Enable {
	Write-Output "Enable -> [Taskbar | 'Right Click'] -> ShowTaskViewButton"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton"
}

Export-ModuleMember -Function *