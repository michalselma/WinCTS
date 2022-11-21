########################################
# Package: Windows Tweaks Script
# Type: CMD (Command Line) / PowerShell
# Platform: Windows 10
# Source Code: https://github.com/michalselma/WinCTS
########################################

#### Interaction - Keyboard - StickyKeys
Function StickyKeysShortcutKey-Disable {
	Write-Output "[DISABLE] StickyKeysShortcutKey"
	Write-Output "[INFO] Settings | Ease Of Access | Interaction | Keyboard | Use Sticky Keys | Allow the shortcut key to start Sticky Keys --> Disable"
	Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Type String -Value "506"
}
Function StickyKeysShortcutKey-Enable {
	Write-Output "[ENABLE] StickyKeysShortcutKey"
	Write-Output "[INFO] Settings | Ease Of Access | Interaction | Keyboard | Use Sticky Keys | Allow the shortcut key to start Sticky Keys --> Enable"
	Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Type String -Value "510"
}

#### Interaction - Keyboard - ToggleKeys
Function ToggleKeysShortcutKey-Disable {
	Write-Output "[DISABLE] ToggleKeysShortcutKey"
	Write-Output "[INFO] Settings | Ease Of Access | Interaction | Keyboard | Use Toggle Keys | Allow the shortcut key to start Toggle Keys --> Disable"
	Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\ToggleKeys" -Name "Flags" -Type String -Value "58"
}
Function ToggleKeysShortcutKey-Enable {
	Write-Output "[ENABLE] ToggleKeysShortcutKey"
	Write-Output "[INFO] Settings | Ease Of Access | Interaction | Keyboard | Use Toggle Keys | Allow the shortcut key to start Toggle Keys --> Enable"
	Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\ToggleKeys" -Name "Flags" -Type String -Value "62"
}

#### Interaction - Keyboard - FilterKeys
Function FilterKeysShortcutKey-Disable {
	Write-Output "[DISABLE] FilterKeysShortcutKey"
	Write-Output "[INFO] Settings | Ease Of Access | Interaction | Keyboard | Use Filter Keys | Allow the shortcut key to start Filter Keys --> Disable"
	Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name "Flags" -Type String -Value "122"
}
Function FilterKeysShortcutKey-Enable {
	Write-Output "[ENABLE] FilterKeysShortcutKey"
	Write-Output "[INFO] Settings | Ease Of Access | Interaction | Keyboard | Use Filter Keys | Allow the shortcut key to start Filter Keys --> Enable"
	Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name "Flags" -Type String -Value "126"
}

Export-ModuleMember -Function *