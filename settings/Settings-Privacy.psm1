########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

# TODO: Regs to be checked:
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity]
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth]
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData]
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput]
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanInterfaceDevice]
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sensors.custom]
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\serialCommunication]
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\usb]
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wifiData]
# [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wiFiDirect]


#### Location
Function Location-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Location | Allow access to location on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Location | Allow apps to access your location"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Location | Allow desktop apps to access your location"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\NonPackaged" -Name "Value" -Value "Deny"
}
Function Location-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Location | Allow access to location on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Location | Allow apps to access your location"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Location | Allow desktop apps to access your location"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\NonPackaged" -Name "Value" -Value "Allow"
}

#### Camera
Function Camera-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Camera | Allow access to the camera on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Camera | Allow apps to access your camera"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Camera | Allow desktop apps to access your camera"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged" -Name "Value" -Value "Deny"
}
Function Camera-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Camera | Allow access to the camera on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Camera | Allow apps to access your camera"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Camera | Allow desktop apps to access your camera"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged" -Name "Value" -Value "Allow"
}

#### Microphone
Function Microphone-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Microphone | Allow access to the microphone on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Microphone | Allow apps to access your microphone"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Microphone | Allow desktop apps to access your microphone"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged" -Name "Value" -Value "Deny"	
	
}
Function Microphone-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Microphone | Allow access to the microphone on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Microphone | Allow apps to access your microphone"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Microphone | Allow desktop apps to access your microphone"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged" -Name "Value" -Value "Allow"
}

#### Voice activation
# *** By default those regs does not exist - They are created when used for the first time from UI. 
# *** TODO: Add check if reg exists - if not, create and set-up as needed.
Function VoiceActivation-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Voice activation | Allow apps to use voice activation"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" -Name "AgentActivationEnabled" -Value 0
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Voice activation | Allow apps to use voice activation when this device is locked"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" -Name "AgentActivationOnLockScreenEnabled" -Value 0
}
Function VoiceActivation-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Voice activation | Allow apps to use voice activation"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" -Name "AgentActivationEnabled" -Value 1
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Voice activation | Allow apps to use voice activation when this device is locked"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" -Name "AgentActivationOnLockScreenEnabled" -Value 1
}

#### Notifications
Function Notifications-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Notifications | Allow access to user notifications on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Notifications | Allow apps to access your notifications"
	# *** NOT IMPLEMENTED YET ***
}
Function Notifications-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Notifications | Allow access to user notifications on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Notifications | Allow apps to access your notifications"
	# *** NOT IMPLEMENTED YET ***
}

#### Account info
Function AccountInfo-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Account info | Allow access to account info on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Account info | Allow apps to access your account info"
	# *** NOT IMPLEMENTED YET ***
}
Function AccountInfo-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Account info | Allow access to account info on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Account info | Allow apps to access your account info"
	# *** NOT IMPLEMENTED YET ***
}

#### Contacts
Function Contacts-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Contacts | Allow access to contacts on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Contacts | Allow apps to access your contacts"
	# *** NOT IMPLEMENTED YET ***
}
Function Contacts-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Contacts | Allow access to contacts on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Contacts | Allow apps to access your contacts"
	# *** NOT IMPLEMENTED YET ***
}

#### Calendar
Function Calendar-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Calendar | Allow access to calendars on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Calendar | Allow apps to access your calendar"
	# *** NOT IMPLEMENTED YET ***
}
Function Calendar-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Calendar | Allow access to calendars on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Calendar | Allow apps to access your calendar"
	# *** NOT IMPLEMENTED YET ***
}

#### Phone calls
Function PhoneCalls-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Phone calls | Allow phone calls on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Phone calls | Allow apps to make phone calls"
	# *** NOT IMPLEMENTED YET ***
}
Function PhoneCalls-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Phone calls | Allow phone calls on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Phone calls | Allow apps to make phone calls"
	# *** NOT IMPLEMENTED YET ***
}

#### Call history
Function CallHistory-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Call history | Allow access to call history on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Call history | Allow apps to access your call history"
	# *** NOT IMPLEMENTED YET ***
}
Function CallHistory-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Call history | Allow access to call history on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Call history | Allow apps to access your call history"
	# *** NOT IMPLEMENTED YET ***
}

#### Email
Function Email-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Email | Allow access to email on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Email | Allow apps to access your email"
	# *** NOT IMPLEMENTED YET ***
}
Function Email-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Email | Allow access to email on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Email | Allow apps to access your email"
	# *** NOT IMPLEMENTED YET ***
}

#### Tasks
Function Tasks-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Tasks | Allow access to tasks on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Tasks | Allow apps to access your tasks"
	# *** NOT IMPLEMENTED YET ***
}
Function Tasks-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Tasks | Allow access to tasks on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Tasks | Allow apps to access your tasks"
	# *** NOT IMPLEMENTED YET ***
}

#### Messaging
Function Messaging-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Messaging | Allow access to messaging on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Messaging | Allow apps to read or send messages"
	# *** NOT IMPLEMENTED YET ***
}
Function Messaging-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Messaging | Allow access to messaging on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Messaging | Allow apps to read or send messages"
	# *** NOT IMPLEMENTED YET ***
}

#### Radios
Function Radios-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Radios | Allow access to control radios on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Radios | Allow apps to control device radios"
	# *** NOT IMPLEMENTED YET ***
}
Function Radios-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Radios | Allow access to control radios on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Radios | Allow apps to control device radios"
	# *** NOT IMPLEMENTED YET ***
}

#### Other devices
Function OtherDevices-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Other devices | Communicate with unpaired devices"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" -Name "Value" -Value "Deny"
}
Function OtherDevices-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Other devices | Communicate with unpaired devices"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" -Name "Value" -Value "Allow"
}

#### Background apps
# *** By default this reg does not exist - It is created when used for the first time from UI. 
# *** TODO: Add check if reg exists - if not, create and set-up as needed.
Function BackgroundApps-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Background apps | Background apps"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Value 1
}
Function BackgroundApps-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Background apps | Background apps"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Value 0
}

#### App diagnostics
Function AppDiagnostics-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow access to app diagnostic info on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow apps to access diagnostic info about your other apps"
	# *** NOT IMPLEMENTED YET ***
}
Function AppDiagnostics-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow access to app diagnostic info on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow apps to access diagnostic info about your other apps"
	# *** NOT IMPLEMENTED YET ***
}

#### Documents
Function Documents-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Documents | Allow access to document libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Documents | Allow apps to access your documents library"
	# *** NOT IMPLEMENTED YET ***
}
Function Documents-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Documents | Allow access to document libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Documents | Allow apps to access your documents library"
	# *** NOT IMPLEMENTED YET ***
}

#### Pictures
Function Pictures-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Pictures | Allow access to picture libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Pictures | Allow apps to access your pictures library"
	# *** NOT IMPLEMENTED YET ***
}
Function Pictures-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Pictures | Allow access to picture libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Pictures | Allow apps to access your pictures library"
	# *** NOT IMPLEMENTED YET ***
}

#### Videos
Function Videos-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Videos | Allow access to video libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Videos | Allow apps to access your videos library"
	# *** NOT IMPLEMENTED YET ***
}
Function Videos-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Videos | Allow access to video libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Videos | Allow apps to access your videos library"
	# *** NOT IMPLEMENTED YET ***
}

#### File system
Function FileSystem-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | File system | Allow access to file system on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | File system | Allow apps to access your file system"
	# *** NOT IMPLEMENTED YET ***
}
Function FileSystem-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | File system | Allow access to file system on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | File system | Allow apps to access your file system"
	# *** NOT IMPLEMENTED YET ***
}

Export-ModuleMember -Function *