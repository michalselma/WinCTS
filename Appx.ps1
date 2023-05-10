####################################################
# Package: Windows Appx Packages Modification Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 11
# Source Code: https://github.com/michalselma/WinCTS
# File Date: 2023-05-10
####################################################


### Check admin rights and if needed relaunch script with admin privileges 
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Write-Host "[WARNING] Script requires Administrator rights. Restarting..."
	Start-Process Appx.cmd -Verb RunAs
	Exit
}
Write-Host "[INFO] Script is run with Administrator rights." 


# Define log file location and name
$logfile = "$PSScriptRoot\log\appx.log"

$datetime = Get-Date -Format "dddd, yyyy-MM-dd HH:mm:ss.fff K"
Write-Output "[START] $datetime" *>> $logfile


# Get configuration file path
$presetpath = "$PSScriptRoot\config\appx.json"

# Read configuration file
$json_config = Get-Content -Raw $presetpath -ErrorAction Stop | ConvertFrom-Json


# Get dictionary file path
$presetpath = "$PSScriptRoot\config\appx-dict.json"

# Read dictionary file
# *** not in use yet
# $json_dict = Get-Content -Raw $presetpath -ErrorAction Stop | ConvertFrom-Json


# Read list of appx installed in OS
# $os_appx_list = Get-AppxPackage -AllUsers | Select-Object Name

# Write-Output "Found the following appx:" *>> $logfile
# Write-Output $os_appx_list *>> $logfile

# Read list of appx installed in OS. Distinct to get unique Names only
$os_appx_list_unique = Get-AppxPackage -AllUsers | Sort-Object -Property Name -Unique | Select-Object Name

Write-Output "Found the following unique appx:" *>> $logfile
Write-Output $os_appx_list_unique *>> $logfile


# Processing Get-AppxPackage -AllUsers
Write-Output "[INFO] Processing removal of AppxPackages for all users" | Tee-Object -FilePath $logfile -Append
foreach ($object in $os_appx_list_unique) {

	# Assign each appx name to $appx_name
	$appx_name=$object.Name

	Write-Output "Processing $appx_name" | Tee-Object -FilePath $logfile -Append

	# if configuration for $appx_name is specified in config file
	if ($json_config.$appx_name) {

		# if action is specified for $appx_name
		if ($json_config.$appx_name.action){

			# Read, check and if applicable action it
			$action=$json_config.$appx_name.action
			Write-Output "$appx_name is set: $action" *>> $logfile
			
			if ($action -eq "sys"){
				Write-Output "$appx_name is system application. Skipping..." *>> $logfile
			}
			
			elseif ($action -eq "skip"){
				Write-Output "$appx_name is set to skip. Skipping..." *>> $logfile
			}
			
			elseif ($action -eq "remove"){
				Write-Output "$appx_name is set to remove. Removing..." *>> $logfile
				$pkg_full_name = (Get-AppxPackage -AllUsers | Where-Object{$_.Name -eq $appx_name} | Select-Object PackageFullName).PackageFullName
				
				# Check if there is single or multiple FullPackage Names for appx (e.g. separate for x32 and x64)
				$count_pkg_full_name = @($pkg_full_name).Count
				Write-Output "There is/are $count_pkg_full_name FullPachageName(s) for $appx_name" *>> $logfile

				if ($count_pkg_full_name -eq 0){
					Write-Output "[ERROR] No FullPackages found for $appx_name" | Tee-Object -FilePath $logfile -Append
				}
				
				elseif ($count_pkg_full_name -eq 1){
					Write-Output "Package Name for $appx_name is $pkg_full_name" *>> $logfile
					Write-Output "[INFO] Removing $pkg_full_name" | Tee-Object -FilePath $logfile -Append
					Remove-AppxPackage -AllUsers -Package $pkg_full_name
				}
				
				else {
					$count = 0
					foreach ($name in $pkg_full_name) {
						$count = $count + 1
						Write-Output "Package Name #$count for $appx_name is $name" *>> $logfile
						Write-Output "[INFO] Removing $name" | Tee-Object -FilePath $logfile -Append
						Remove-AppxPackage -AllUsers -Package $name
					}
				}
			}
			
			else {Write-Output "[ERROR] Unknown action type $action for $appx_name" | Tee-Object -FilePath $logfile -Append}
		}
		
		else {Write-Output "[WARNING] No action found in configuration file for $appx_name" | Tee-Object -FilePath $logfile -Append}
	}
	
	else {Write-Output "[WARNING] No configuration for $appx_name" | Tee-Object -FilePath $logfile -Append}
}

# Read list of provisioned appx installed in OS.
# $os_appx_prov_list = Get-AppxProvisionedPackage -Online | Select-Object DisplayName

# Write-Output "Found the following provisioned appx:" *>> $logfile
# Write-Output $os_appx_prov_list *>> $logfile


# Read list of provisioned appx installed in OS. Distinct to get unique DisplayNames only
$os_appx_prov_list_unique = Get-AppxProvisionedPackage -Online | Sort-Object -Property DisplayName -Unique | Select-Object DisplayName

Write-Output "Found the following unique provisioned appx:" *>> $logfile
Write-Output $os_appx_prov_list_unique *>> $logfile


# Processing Get-AppxProvisionedPackage -Online
Write-Output "[INFO] Processing removal of AppxProvisionedPackages" | Tee-Object -FilePath $logfile -Append
foreach ($object in $os_appx_prov_list_unique) {

	# Assign each appx name to $appx_name
	$appx_prov_name=$object.DisplayName

	Write-Output "Processing $appx_prov_name" | Tee-Object -FilePath $logfile -Append

	# if configuration for $appx_name is specified in config file
	if ($json_config.$appx_prov_name) {

		# if action is specified for $appx_name
		if ($json_config.$appx_prov_name.action) {

			# Read, check and if applicable action it
			$action=$json_config.$appx_prov_name.action
			Write-Output "$appx_prov_name is set: $action" *>> $logfile
			
			if ($action -eq "sys"){
				Write-Output "$appx_prov_name is system application. Skipping..." *>> $logfile
			}
			
			elseif ($action -eq "skip"){
				Write-Output "$appx_prov_name is set to skip. Skipping..." *>> $logfile
			}
			
			elseif ($action -eq "remove"){
				Write-Output "$appx_prov_name is set to remove. Removing..." *>> $logfile
				$prov_pkg_full_name = (Get-AppxProvisionedPackage -Online | Where-Object{$_.DisplayName -eq $appx_prov_name} | Select-Object PackageName).PackageName
				Write-Output "Package Name for $appx_prov_name is $pkg_full_name" *>> $logfile
				Write-Output "[INFO] Removing $prov_pkg_full_name" | Tee-Object -FilePath $logfile -Append
				Remove-AppxPackage -AllUsers -Package $prov_pkg_full_name
			}
			
			else {Write-Output "[ERROR] Unknown action type $action for $appx_prov_name" | Tee-Object -FilePath $logfile -Append}
		}
		
		else {Write-Output "[WARNING] No action found in configuration file for $appx_prov_name" | Tee-Object -FilePath $logfile -Append}
	}
	
	else {Write-Output "[WARNING] No configuration for $appx_prov_name" | Tee-Object -FilePath $logfile -Append}
}


$datetime = Get-Date -Format "dddd, yyyy-MM-dd HH:mm:ss.fff K"
Write-Output "[END] $datetime" *>> $logfile
