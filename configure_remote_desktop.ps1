$rdPort = 3389

# Add user to local group to enable logging in with RDP
$username = "Server"
Add-LocalGroupMember -Group "Users" -Member $username
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $username

# Add firewall rules
Remove-NetFirewallRule -Name RDP_UDP_OPEN
New-NetFirewallRule -Name RDP_UDP_OPEN -Protocol UDP -LocalPort $rdPort -Enabled True -Action Allow -Profile Any -DisplayName "RDP UDP Open"
Remove-NetFirewallRule -Name RDP_TCP_OPEN
New-NetFirewallRule -Name RDP_TCP_OPEN -Protocol TCP -LocalPort $rdPort -Enabled True -Action Allow -Profile Any -DisplayName "RDP TCP Open"

# Allow local connections
Set-NetConnectionProfile -InterfaceIndex (Get-NetConnectionProfile).InterfaceIndex -NetworkCategory Private

# Set listening port for remote desktop services
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name PortNumber -Value $rdPort -PropertyType DWORD -Force

# Enable and related services
$nameWildcard = "*remote desktop*"
Get-Service -DisplayName $nameWildcard | ForEach-Object -Process {Set-Service -Name $_.Name -StartupType Automatic}
# Start-Service -DisplayName $nameWildcard
shutdown /r /f /t 0
