#### Windows Update Group Policy control
Function DisableWUPolicyControl {
	Write-Output "Windows hidden settings|Removing Windows Update Group Policy control..."
	Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Recurse -ErrorAction SilentlyContinue
	Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Recurse -ErrorAction SilentlyContinue
}
Function EnableWUPolicyControl {
	Write-Output "Windows hidden settings|Run your Group Policy refresh when connected to corporate network ('gpupdate /force' command)..."
}

# Export functions
Export-ModuleMember -Function *