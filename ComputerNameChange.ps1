####################################################
# Package: Change Windows Computer Name Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 11
# Source Code: https://github.com/michalselma/WinCTS
# File Date: 2023-04-23
####################################################


# Check admin rights and if needed relaunch script with admin privileges 
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Write-Host "Script requires Administrator rights. Restarting..."
	Start-Process ComputerNameChange.cmd -Verb RunAs
	Exit
}
Write-Host "Script is run with Administrator rights."


# Define log file location and name
$logfile = "$PSScriptRoot\log\computername.log"

$datetime = Get-Date -Format "dddd, yyyy-MM-dd HH:mm:ss.fff K"
Write-Output "[START] $datetime" *>> $logfile


# Get current computer name
$computerName = hostname
Write-Output "Current Computer Name: $computerName" | Tee-Object -FilePath $logfile -Append


# Start rename
$confirmRename = Read-Host "Do you want to change computer name ? (input 'y' or 'yes' and press ENTER to continue)"

if ((('y', 'yes') -contains $confirmRename)) {
	$newComputerName = Read-Host 'Enter New Computer Name'
	Write-Output "Changing Computer Name to: $newComputerName" | Tee-Object -FilePath $logfile -Append
	Rename-Computer -NewName $newComputerName

	# Ask to restart computer
	$restart = Read-Host "Computer requires restart to appply changes. Input 'y' or 'yes' to restart computer now or ENTER to skip"
	if ((('y', 'yes') -contains $restart)) {
		Write-Output "Restarting... " | Tee-Object -FilePath $logfile -Append
		Restart-Computer
	}

	else {
		Write-Output "Skipping computer restart now. Please restart your computer later." | Tee-Object -FilePath $logfile -Append
	}
} 

else {
	Write-Output "Undefined key pressed. Skipping..." | Tee-Object -FilePath $logfile -Append
}


$datetime = Get-Date -Format "dddd, yyyy-MM-dd HH:mm:ss.fff K"
Write-Output "[END  ] $datetime" *>> $logfile
Write-Output "[#####]" *>> $logfile