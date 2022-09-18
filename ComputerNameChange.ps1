########################################
# Package: Change Windows Computer Name Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10 / Windows 11
# Source Code: https://github.com/michalselma/WinCTS
########################################

$confirmRename = Read-Host "Do you want to change computer name ? (input 'y' or 'yes' and press ENTER to continue)"
if ((('y', 'yes') -contains $confirmRename)) {
	$computerName = Read-Host 'Enter New Computer Name'
	Write-Host "Changing Computer Name to: " $computerName
	Rename-Computer -NewName $computerName
	$restart = Read-Host "Computer has been renamed and requires restart. Input 'y' or 'yes' to restart computer now or ENTER to skip"
	if ((('y', 'yes') -contains $restart)) {
		Write-Host "Restarting... "
		Restart-Computer
	}
	else {
		Write-Host "Skipping restart now. To apply changes restart your computer."
	}
} 
else {
	Write-Host "Undefined key pressed. Skipping Computer Rename."
}