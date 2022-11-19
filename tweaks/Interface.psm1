########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### Windows build number and Windows edition (Home/Pro/Enterprise) at bottom right of desktop
Function BuildNumberOnDesktop-Disable {
	Write-Output "Disable -> User Interface -> Desktop -> Show Windows build number on desktop"
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "PaintDesktopVersion" -Type DWord -Value 0
}
Function BuildNumberOnDesktop-Enable {
	Write-Output "Enable -> User Interface -> Desktop -> Show Windows build number on desktop"
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "PaintDesktopVersion" -Type DWord -Value 1
}

#### Web Search Results for Start Menu / Taskbar Search
Function WebSearchResultForTaskbarSearch-Disable {
	Write-Output "Disable -> User Interface -> Desktop -> Web (Bing) Search Results for Start Menu / Taskbar Search"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Type DWord -Value 0
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Type DWord -Value 1
}
Function WebSearchResultForTaskbarSearch-Enable {
	Write-Output "Enable -> User Interface -> Desktop -> Web (Bing) Search Results for Start Menu / Taskbar Search"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -ErrorAction SilentlyContinue
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Type DWord -Value 1
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -ErrorAction SilentlyContinue
}

# Export functions
Export-ModuleMember -Function *