#### Windows build number and Windows edition (Home/Pro/Enterprise) at bottom right of desktop
#### 0-hide (default), 1-show
Function DisableBuildNumberOnDesktop {
	Write-Output "Windows build number on desktop -> Hide"
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "PaintDesktopVersion" -Type DWord -Value 0
}
Function EnableBuildNumberOnDesktop {
	Write-Output "Windows build number on desktop -> Show"
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "PaintDesktopVersion" -Type DWord -Value 1
}

# Export functions
Export-ModuleMember -Function *