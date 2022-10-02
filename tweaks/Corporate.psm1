#### Windows Update Group Policy control
Function DisableWUPolicyControl {
	Write-Output "Windows hidden settings|Removing Windows Update Group Policy control..."
	#TO-DO: Create list of all items in those two registry paths and execute Remove-Item for each of them
	#Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -ErrorAction SilentlyContinue
	#Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -ErrorAction SilentlyContinue
}
Function EnableWUPolicyControl {
	Write-Output "Windows hidden settings|Run your Group Policy refresh when connected to corporate network ('gpupdate /force' command)..."
}

# Export functions
Export-ModuleMember -Function *