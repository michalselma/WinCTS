########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### File Explorer - Show hidden files and folders
Function ShowHiddenFilesAndFolders-Disable {
	Write-Output "Disable -> [Control Panel | Appearance and Personalization | File Explorer Options] -> View -> Hidden files and folders"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Type DWord -Value 2
}
Function ShowHiddenFilesAndFolders-Enable {
	Write-Output "Enable -> [Control Panel | Appearance and Personalization | File Explorer Options] -> View -> Hidden files and folders"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Type DWord -Value 1
}

#### File Explorer - Hide Known file extensions
Function HideKnownFileExtensions-Disable {
	Write-Output "Disable -> [Control Panel | Appearance and Personalization | File Explorer Options] -> View -> Hide extensions for known file types"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 0
}
Function HideKnownFileExtensions-Enable {
	Write-Output "Enable -> [Control Panel | Appearance and Personalization | File Explorer Options] -> View -> Hide extensions for known file types"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 1
}

#### File Explorer - Hide Protected operating system files
Function HideProtectedSystemFiles-Disable {
	Write-Output "Disable -> [Control Panel | Appearance and Personalization | File Explorer Options] -> View -> Hide protected operating system files"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden" -Type DWord -Value 1
}
Function HideProtectedSystemFiles-Enable {
	Write-Output "Enable -> [Control Panel | Appearance and Personalization | File Explorer Options] -> View -> Hide protected operating system files"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden" -Type DWord -Value 0
}

Export-ModuleMember -Function *