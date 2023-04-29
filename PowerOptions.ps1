####################################################
# Package: Windows Power Options Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 11
# Source Code: https://github.com/michalselma/WinCTS
# File Date: 2023-04-29
####################################################


### Check admin rights and if needed relaunch script with admin privileges 
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Write-Host "[WARNING] Script requires Administrator rights. Restarting..."
	Start-Process PowerOptions.cmd -Verb RunAs
	Exit
}
Write-Host "[INFO] Script is run with Administrator rights."


# Define log file location and name
$logfile = "$PSScriptRoot\log\power.log"

$datetime = Get-Date -Format "dddd, yyyy-MM-dd HH:mm:ss.fff K"
Write-Output "[START] $datetime" *>> $logfile


# Get configuration file path
$presetpath = "$PSScriptRoot\config\power.json"

# Read configuration file
$json_config = Get-Content -Raw $presetpath -ErrorAction Stop | ConvertFrom-Json


# Get dictionary file path
$presetpath = "$PSScriptRoot\config\power-dict.json"

# Read dictionary file
$json_dict = Get-Content -Raw $presetpath -ErrorAction Stop | ConvertFrom-Json


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
	Write-Output "[INFO] Incorrect option. Stopping script." | Tee-Object -FilePath $logfile -Append
	Exit
}


Write-Output "Preset type: $option" | Tee-Object -FilePath $logfile -Append


# Setting-up power options for chosen preset
foreach ($object in $json_config.PSObject.Properties) {
	$id = $object.Name
	
	# If chosen preset (desktop/laptop) is defined in option key in dictionary for object, start processing
	if (($json_dict.$id.option -contains $option)) {
		Write-Output "[INFO] Processing $id" | Tee-Object -FilePath $logfile -Append

		$type=$json_config.$id.type
		$key=$json_config.$id.key
		$value=$json_config.$id.value

		# Execute Windows 'powercfg.exe' with specific switch (type) and/or key-value data
		if ($type -eq "change") {
			Write-Output "Executing: powercfg /change $key $value" *>> $logfile
			powercfg /change $key $value
		}
		
		elseif ($type -eq "setdcvalueindex") {
			Write-Output "Executing: powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS $key $value" *>> $logfile
			powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS $key $value
		}
		
		elseif ($type -eq "setacvalueindex") {
			Write-Output "Executing: powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS $key $value" *>> $logfile
			powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS $key $value
		}
		
		elseif ($type -eq "other") {
			Write-Output "Executing: powercfg /$key $value" *>> $logfile
			powercfg /$key $value
		} 
		
		else {
			Write-Output "[ERROR] Incorrect configuration type $type for id $id" | Tee-Object -FilePath $logfile -Append
		}
	}

	else {
		Write-Output "Skipping $id" *>> $logfile
	}
}


$datetime = Get-Date -Format "dddd, yyyy-MM-dd HH:mm:ss.fff K"
Write-Output "[END] $datetime" *>> $logfile
