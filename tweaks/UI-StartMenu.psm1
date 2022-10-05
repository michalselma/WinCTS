#### 'Recently added' list in the Start Menu
Function DisableRecentlyAddedApps {
	Write-Output "'Recently added' list in the Start Menu -> Hide"
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "HideRecentlyAddedApps" -Type DWord -Value 1
}
Function EnableRecentlyAddedApps {
	Write-Output "'Recently added' list in the Start Menu -> Show"
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "HideRecentlyAddedApps" -ErrorAction SilentlyContinue
}

# Export functions
Export-ModuleMember -Function *