Add-LocalGroupMember -Group "Users" -Member "Server"
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "Server"

New-NetFirewallRule -Name RDP_UDP_OPEN -Protocol UDP -LocalPort 1521 -Enabled True -Action Allow -Profile Any -DisplayName "RDP UDP Open"
New-NetFirewallRule -Name RDP_TCP_OPEN -Protocol TCP -LocalPort 1521 -Enabled True -Action Allow -Profile Any -DisplayName "RDP TCP Open"

$idx = Get-NetConnectionProfile | Select-Object -ExpandProperty InterfaceIndex
Set-NetConnectionProfile -InterfaceIndex $idx -NetworkCategory Private

New-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name PortNumber -Value 1521 -PropertyType DWORD -Force
