# Add user to local group to enable logging in with RDP
Add-LocalGroupMember -Group "Users" -Member "Server"
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "Server"

$rdPort = 1521

# Firewall rules
Remove-NetFirewallRule -Name RDP_UDP_OPEN
New-NetFirewallRule -Name RDP_UDP_OPEN -Protocol UDP -LocalPort $rdPort -Enabled True -Action Allow -Profile Any -DisplayName "RDP UDP Open"
Remove-NetFirewallRule -Name RDP_TCP_OPEN
New-NetFirewallRule -Name RDP_TCP_OPEN -Protocol TCP -LocalPort $rdPort -Enabled True -Action Allow -Profile Any -DisplayName "RDP TCP Open"

# Allow local connections
$idx = Get-NetConnectionProfile | Select-Object -ExpandProperty InterfaceIndex
Set-NetConnectionProfile -InterfaceIndex $idx -NetworkCategory Private

# Set listening port for remote desktop services
New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name PortNumber -Value $rdPort -PropertyType DWORD -Force

# Start related services
$nameWildcard = "*remote desktop*"
Get-Service -DisplayName $nameWildcard | Select-Object -ExpandProperty Name | ForEach-Object -Process {Set-Service -Name $_ -StartupType Automatic}
Start-Service -DisplayName $nameWildcard
