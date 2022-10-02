#### Taskbar Search icon/box Mode
#### 0-none, 1-icon, 2-box (default) (Win11 -> default is no registry key-value = icon) 
Function DisableTaskbarSearchIcon {
	Write-Output "Searchbox Taskbar Mode -> Disabled"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
}
Function EnableTaskbarSearchIcon {
	Write-Output "Searchbox Taskbar Mode -> Icon (TaskbarSearchBox setting should be set to 'Skip'"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 1
}
Function DisableTaskbarSearchBox {
	Write-Output "Searchbox Taskbar Mode -> Disabled"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
}
Function EnableTaskbarSearchBox {
	Write-Output "Searchbox Taskbar Mode -> Box (TaskbarSearchIcon setting should be set to 'Skip'"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 2
}

#### Task View Button
#### 0-hide, 1-show, (default is no registry key-value = show task view button)
Function DisableTaskViewButton {
	Write-Output "Task View Button - Hide"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
}
Function EnableTaskViewButton {
	Write-Output "Task View Button - Show"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -ErrorAction SilentlyContinue
}

#### Taskbar Icons Size Type
#### 0-normal, 1-small, (Win10 -> default is no registry key-value = normal size icons, Win11 -> ???)
Function DisableSmallTaskbarIcons {
	Write-Output "Small icons in taskbar -> Disable"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons" -ErrorAction SilentlyContinue
}
Function EnableSmallTaskbarIcons {
	Write-Output "Small icons in taskbar -> Enable"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons" -Type DWord -Value 1
}

#### Show All Tray Icons
#### 0-hide tray icons as needed, 1-show all, (default is no policy set (no registry key-value) = hide tray icons when needed, Win11 does not work!)
Function DisableShowAllTrayIcons {
	Write-Output "Show All Tray Icons - Disable"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoAutoTrayNotify" -ErrorAction SilentlyContinue
}
Function EnableShowAllTrayIcons {
	Write-Output "Show All Tray Icons - Enable"
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoAutoTrayNotify" -Type DWord -Value 1
}

#### Taskbar People icon
#### 0-hide, 1-show, (default is no policy set (no registry key-value) = show taskbar people icon)
Function DisableTaskbarPeopleIcon {
	Write-Output "Taskbar People icon - Hide"
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
}
Function EnableTaskbarPeopleIcon {
	Write-Output "Taskbar People icon - Show"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -ErrorAction SilentlyContinue
}

# Export functions
Export-ModuleMember -Function *