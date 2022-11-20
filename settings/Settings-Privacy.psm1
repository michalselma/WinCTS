########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### General - AdvertisingID
Function AdvertisingID-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> Windows permisions | General | Let apps use advertising ID to make ads more interesting to you based on your app usage"
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo"
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Type DWord -Value 0
}
Function AdvertisingID-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> Windows permisions | General | Let apps use advertising ID to make ads more interesting to you based on your app usage"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Type DWord -Value 1
}

#### General - Website access to language list
Function WebAccessToLangList-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> Windows permisions | General | Let websites provide locally relevant content by accessing my language list"
	Set-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name "HttpAcceptLanguageOptOut" -Type DWord -Value 1
}
Function WebAccessToLangList-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> Windows permisions | General | Let websites provide locally relevant content by accessing my language list"
	# Set to 0 or Remove to Enable
	#Set-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name "HttpAcceptLanguageOptOut" -Type DWord -Value 0
	Remove-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name "HttpAcceptLanguageOptOut"
}

#### General - Track app launches
# Enabling this option will "grey out": [Settings | Personalization] -> Start | Show most used apps
Function LetTrackAppLaunches-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> Windows permisions | General | Let Windows track app launches to improve Start and search results"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackProgs" -Type DWord -Value 0
}
Function LetTrackAppLaunches-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> Windows permisions | General | Let Windows track app launches to improve Start and search results"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackProgs" -Type DWord -Value 1
	# or probably remove this key - to be checked
}

#### General - Show me suggested content in the Settings app
# Enabling this option will "grey out": [Settings | Personalization] -> Start | Show most used apps
Function SuggestedContentInSettings-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> Windows permisions | General | Show me suggested content in the Settings app"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353696Enabled" -Type DWord -Value 0
}
Function SuggestedContentInSettings-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> Windows permisions | General | Show me suggested content in the Settings app"
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled"
	#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353696Enabled" -Type DWord -Value 1
}

#### Diagnostics & feedback - Tailored experiences
Function TailoredExperiences-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> Windows permisions | Diagnostics & feedback | Tailored experiences"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Type DWord -Value 0
}
Function TailoredExperiences-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> Windows permisions | Diagnostics & feedback | Tailored experiences"
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Type DWord -Value 1
}

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
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Notifications-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Notifications | Allow access to user notifications on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Notifications | Allow apps to access your notifications"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Account info
Function AccountInfo-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Account info | Allow access to account info on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Account info | Allow apps to access your account info"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function AccountInfo-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Account info | Allow access to account info on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Account info | Allow apps to access your account info"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Contacts
Function Contacts-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Contacts | Allow access to contacts on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Contacts | Allow apps to access your contacts"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Contacts-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Contacts | Allow access to contacts on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Contacts | Allow apps to access your contacts"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Calendar
Function Calendar-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Calendar | Allow access to calendars on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Calendar | Allow apps to access your calendar"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Calendar-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Calendar | Allow access to calendars on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Calendar | Allow apps to access your calendar"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Phone calls
Function PhoneCalls-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Phone calls | Allow phone calls on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Phone calls | Allow apps to make phone calls"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function PhoneCalls-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Phone calls | Allow phone calls on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Phone calls | Allow apps to make phone calls"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Call history
Function CallHistory-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Call history | Allow access to call history on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Call history | Allow apps to access your call history"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function CallHistory-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Call history | Allow access to call history on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Call history | Allow apps to access your call history"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Email
Function Email-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Email | Allow access to email on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Email | Allow apps to access your email"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Email-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Email | Allow access to email on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Email | Allow apps to access your email"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Tasks
Function Tasks-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Tasks | Allow access to tasks on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Tasks | Allow apps to access your tasks"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Tasks-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Tasks | Allow access to tasks on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Tasks | Allow apps to access your tasks"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Messaging
Function Messaging-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Messaging | Allow access to messaging on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Messaging | Allow apps to read or send messages"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Messaging-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Messaging | Allow access to messaging on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Messaging | Allow apps to read or send messages"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Radios
Function Radios-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Radios | Allow access to control radios on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Radios | Allow apps to control device radios"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Radios-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Radios | Allow access to control radios on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Radios | Allow apps to control device radios"
	Write-Output "*** NOT IMPLEMENTED YET ***"
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
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function AppDiagnostics-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow access to app diagnostic info on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow apps to access diagnostic info about your other apps"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Documents
Function Documents-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Documents | Allow access to document libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Documents | Allow apps to access your documents library"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Documents-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Documents | Allow access to document libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Documents | Allow apps to access your documents library"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Pictures
Function Pictures-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Pictures | Allow access to picture libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Pictures | Allow apps to access your pictures library"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Pictures-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Pictures | Allow access to picture libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Pictures | Allow apps to access your pictures library"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### Videos
Function Videos-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Videos | Allow access to video libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Videos | Allow apps to access your videos library"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function Videos-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Videos | Allow access to video libraries on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Videos | Allow apps to access your videos library"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

#### File system
Function FileSystem-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | File system | Allow access to file system on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" -Name "Value" -Value "Deny"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | File system | Allow apps to access your file system"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}
Function FileSystem-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | File system | Allow access to file system on this device"
	Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" -Name "Value" -Value "Allow"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | File system | Allow apps to access your file system"
	Write-Output "*** NOT IMPLEMENTED YET ***"
}

Export-ModuleMember -Function *