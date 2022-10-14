Add-LocalGroupMember -Group "Users" -Member "Server"
Add-LocalGroupMember -Group "Remote Desktop Users" -Member "Server"

New-NetFirewallRule -Name RDP_UDP_OPEN -Protocol UDP -RemotePort 1521 -Enabled True -Action Allow -Profile Any -DisplayName "RDP UDP Open"
New-NetFirewallRule -Name RDP_TCP_OPEN -Protocol TCP -RemotePort 1521 -Enabled True -Action Allow -Profile Any -DisplayName "RDP TCP Open"

$idx = Get-NetConnectionProfile | Select-Object -ExpandProperty InterfaceIndex
Set-NetConnectionProfile -InterfaceIndex $idx -NetworkCategory Private
