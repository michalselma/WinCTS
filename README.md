WinCTS (Windows Configuration Tweak Scripts)

Windows operating system tweaks is package of command line and powershell scripts.

Functionality:
- Power Options - modify behavior of power buttons and power saving options. There is separate configuration for Desktop and Laptop computer type.
- Computer Name Change - modify windows machine/computer name.
- AppxPackages - uninstall, permanently remove or reinstall Microsoft appx applications/packages for current user, all users or future users.

Usage:
- Review and/or edit content of the config files in config subfolder
- Run particular cmd scripts with admin privileges

Known Errors:
- KE2209001 - AppxPackage uninstall for all users throws error at the end. After removal from last local user package will move automatically to staged status/user ({S-1-5-18 [S-1-5-18]: Staged}), which is not removabe by "Remove-AppxPackage" command. Regardless error package is being removed for all local users."

AUTHOR:
Michal Selma <michal@selma.cc>
