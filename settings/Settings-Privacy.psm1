########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### Location
Function Location-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Location | Allow access to location on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Location | Allow apps to access your location"
}
Function Location-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Location | Allow access to location on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Location | Allow apps to access your location"
}

#### Camera
Function Camera-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Camera | Allow access to the camera on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Camera | Allow apps to access your camera"
}
Function Camera-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Camera | Allow access to the camera on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Camera | Allow apps to access your camera"
}

#### Microphone
Function Microphone-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Microphone | Allow access to the microphone on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Microphone | Allow apps to access your microphone"
}
Function Microphone-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Microphone | Allow access to the microphone on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Microphone | Allow apps to access your microphone"
}

#### Voice activation
Function VoiceActivation-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Voice activation | Allow apps to use voice activation"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Voice activation | Allow apps to use voice activation when this device is locked"
}
Function VoiceActivation-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Voice activation | Allow apps to use voice activation"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Voice activation | Allow apps to use voice activation when this device is locked"
}

#### Notifications
Function Notifications-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Notifications | Allow access to user notifications on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Notifications | Allow apps to access your notifications"
}
Function Notifications-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Notifications | Allow access to user notifications on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Notifications | Allow apps to access your notifications"
}

#### Account info
Function AccountInfo-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Account info | Allow access to account info on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Account info | Allow apps to access your account info"
}
Function AccountInfo-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Account info | Allow access to account info on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Account info | Allow apps to access your account info"
}

#### Contacts
Function Contacts-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Contacts | Allow access to contacts on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Contacts | Allow apps to access your contacts"
}
Function Contacts-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Contacts | Allow access to contacts on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Contacts | Allow apps to access your contacts"
}

#### Calendar
Function Calendar-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Calendar | Allow access to calendars on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Calendar | Allow apps to access your calendar"
}
Function Calendar-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Calendar | Allow access to calendars on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Calendar | Allow apps to access your calendar"
}

#### Phone calls
Function PhoneCalls-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Phone calls | Allow phone calls on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Phone calls | Allow apps to make phone calls"
}
Function PhoneCalls-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Phone calls | Allow phone calls on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Phone calls | Allow apps to make phone calls"
}

#### Call history
Function CallHistory-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Call history | Allow access to call history on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Call history | Allow apps to access your call history"
}
Function CallHistory-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Call history | Allow access to call history on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Call history | Allow apps to access your call history"
}

#### Email
Function Email-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Email | Allow access to email on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Email | Allow apps to access your email"
}
Function Email-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Email | Allow access to email on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Email | Allow apps to access your email"
}

#### Tasks
Function Tasks-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Tasks | Allow access to tasks on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Tasks | Allow apps to access your tasks"
}
Function Tasks-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Tasks | Allow access to tasks on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Tasks | Allow apps to access your tasks"
}

#### Messaging
Function Messaging-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Messaging | Allow access to messaging on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Messaging | Allow apps to read or send messages"
}
Function Messaging-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Messaging | Allow access to messaging on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Messaging | Allow apps to read or send messages"
}

#### Radios
Function Radios-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Radios | Allow access to control radios on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Radios | Allow apps to control device radios"
}
Function Radios-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Radios | Allow access to control radios on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Radios | Allow apps to control device radios"
}

#### Other devices
Function OtherDevices-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Other devices | Communicate with unpaired devices"
}
Function OtherDevices-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Other devices | Communicate with unpaired devices"
}

#### Background apps
Function BackgroundApps-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Background apps | Background apps"
}
Function BackgroundApps-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Background apps | Background apps"
}

#### App diagnostics
Function AppDiagnostics-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow access to app diagnostic info on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow apps to access diagnostic info about your other apps"
}
Function AppDiagnostics-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow access to app diagnostic info on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | App diagnostics | Allow apps to access diagnostic info about your other apps"
}

#### Automatic file downloads
Function AutomaticFileDownloads-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Automatic file downloads | Automatic file downloads"
}
Function AutomaticFileDownloads-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Automatic file downloads | Automatic file downloads"
}

#### Documents
Function Documents-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Documents | Allow access to document libraries on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Documents | Allow apps to access your documents library"
}
Function Documents-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Documents | Allow access to document libraries on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Documents | Allow apps to access your documents library"
}

#### Pictures
Function Pictures-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Pictures | Allow access to picture libraries on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Pictures | Allow apps to access your pictures library"
}
Function Pictures-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Pictures | Allow access to picture libraries on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Pictures | Allow apps to access your pictures library"
}

#### Videos
Function Videos-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Videos | Allow access to video libraries on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | Videos | Allow apps to access your videos library"
}
Function Videos-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Videos | Allow access to video libraries on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | Videos | Allow apps to access your videos library"
}

#### File system
Function FileSystem-Disable {
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | File system | Allow access to file system on this device"
	Write-Output "Disable -> [Settings | Privacy] -> App permisions | File system | Allow apps to access your file system"
}
Function FileSystem-Enable {
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | File system | Allow access to file system on this device"
	Write-Output "Enable -> [Settings | Privacy] -> App permisions | File system | Allow apps to access your file system"
}

Export-ModuleMember -Function *