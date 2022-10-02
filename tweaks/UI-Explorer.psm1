#### Known file extensions
#### 0-show, 1-hide (default)
Function DisableKnownFileExtensions {
	Write-Output "Known file extensions -> Hide"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 1
}
Function EnableKnownFileExtensions {
	Write-Output "Known file extensions -> Show"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 0
}

#### Hidden files
#### 1-show, 2-hide (default)
Function DisableHiddenFiles {
	Write-Output "Hidden Files -> Hide"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Type DWord -Value 2
}
Function EnableHiddenFiles {
	Write-Output "Hidden Files -> Show"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Type DWord -Value 1
}

#### Protected operating system files
#### 0-hide (default), 1-show
Function DisableProtectedSystemFiles {
	Write-Output "Protected operating system files -> Hide"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden" -Type DWord -Value 0
}
Function EnableProtectedSystemFiles {
	Write-Output "Protected operating system files -> Show"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSuperHidden" -Type DWord -Value 1
}

# Export functions
Export-ModuleMember -Function *