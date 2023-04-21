####################################################
# Package: Windows Power Options Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 11
# Source Code: https://github.com/michalselma/WinCTS
# File Date: 2023-04-21
####################################################


### Check admin rights and if needed relaunch script with admin privileges 
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Write-Host "[WARNING] Script requires Administrator rights. Restarting..."
	Start-Process PowerOptions.cmd -Verb RunAs
	Exit
}
Write-Host "[INFO] Script is run with Administrator rights." 


# Define log file location and name
$logfile = "$PSScriptRoot\log\poweroptions.log"

$datetime = Get-Date -Format "dddd, yyyy-MM-dd HH:mm:ss.fff K"
Write-Output "[START] $datetime" *>> $logfile


#  Get configuration file path
$presetpath = "$PSScriptRoot\config\poweroptions.json"


# Read Config File
$json = Get-Content -Raw $presetpath -ErrorAction Stop | ConvertFrom-Json


# Get config choise from user
Write-Host "Choose power options preset type"
Write-Host "1 - Desktop"
Write-Host "2 - Laptop"
$configtype = Read-Host "Input preset value and press Enter"

if ((('1') -contains $configtype)) {
	$option = 'desktop'	
}
elseif ((('2') -contains $configtype)) {
	$option = 'laptop'	
}
else {
	Write-Output "[ERROR] Incorrect option. Stopping script." | Tee-Object -FilePath $logfile -Append
	Exit
}


# Setting-up power options for chosen preset
foreach ($object in $json) {
	$id = $object.id

	# If chosen preset (desktop/laptop) is defined in configuration for object start processing
	if (($object.option -contains $option)) {
		Write-Output "[INFO ] Processing $id" | Tee-Object -FilePath $logfile -Append

		$type=$object.type
		$key=$object.key
		$value=$object.value

		# Execute Windows 'powercfg.exe' with specific switch (type) and/or key-value data
		if ($type -eq "change") {
			powercfg /change $key $value
		}
		elseif ($type -eq "setdcvalueindex") {
			powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS $key $value
		}
		elseif ($type -eq "setacvalueindex") {
			powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS $key $value
		}
		elseif ($type -eq "other") {
			powercfg /$key $value
		} 
		else {
			Write-Output "[ERROR] Incorrect configuration type $type for id $id" | Tee-Object -FilePath $logfile -Append
		}
	}

	else {
		Write-Output "[INFO ] Skipping $id" *>> $logfile
	}		
}


$datetime = Get-Date -Format "dddd, yyyy-MM-dd HH:mm:ss.fff K"
Write-Output "[END  ] $datetime" *>> $logfile
Write-Output "[#####]" *>> $logfile