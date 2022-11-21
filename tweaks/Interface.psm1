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
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Type DWord -Value 1
}
Function WebSearchResultForTaskbarSearch-Enable {
	Write-Output "Enable -> User Interface -> Desktop -> Web (Bing) Search Results for Start Menu / Taskbar Search"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Type DWord -Value 1
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch"
}

# Unpin all Start Menu tiles
Function UnpinStartMenuTiles-Disable {
	Write-Output "[DISABLE] UnpinStartMenuTiles"
	Write-Output "[INFO] UnpinStartMenuTiles function has no revoke option. You have to pin the tiles back manually."
}
Function UnpinStartMenuTiles-Enable {
	Write-Output "[ENABLE] UnpinStartMenuTiles"
	Write-Output "[INFO] Unpinning all Start Menu tiles..."
	If ([System.Environment]::OSVersion.Version.Build -ge 15063 -And [System.Environment]::OSVersion.Version.Build -le 16299) {
		Get-ChildItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" -Include "*.group" -Recurse | ForEach-Object {
			$data = (Get-ItemProperty -Path "$($_.PsPath)\Current" -Name "Data").Data -Join ","
			$data = $data.Substring(0, $data.IndexOf(",0,202,30") + 9) + ",0,202,80,0,0"
			Set-ItemProperty -Path "$($_.PsPath)\Current" -Name "Data" -Type Binary -Value $data.Split(",")
		}
	} ElseIf ([System.Environment]::OSVersion.Version.Build -ge 17134) {
		$key = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount\*start.tilegrid`$windows.data.curatedtilecollection.tilecollection\Current"
		$data = $key.Data[0..25] + ([byte[]](202,50,0,226,44,1,1,0,0))
		Set-ItemProperty -Path $key.PSPath -Name "Data" -Type Binary -Value $data
		Stop-Process -Name "ShellExperienceHost" -Force -ErrorAction SilentlyContinue
	}
}

# Unpin all Taskbar icons
Function UnpinTaskbarIcons-Disable {
	Write-Output "[DISABLE] UnpinTaskbarIcons"
	Write-Output "[INFO] UnpinTaskbarIcons function has no revoke option. You have to pin the icons back manually."
}
Function UnpinTaskbarIcons-Enable {
	Write-Output "[ENABLE] UnpinTaskbarIcons"
	Write-Output "[INFO] Unpinning all Taskbar icons..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites" -Type Binary -Value ([byte[]](255))
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "FavoritesResolve" -ErrorAction SilentlyContinue
}

# Export functions
Export-ModuleMember -Function *