nmcli connection delete Slave2
nmcli connection delete Slave1
nmcli connection delete Bond0
sleep 0.5
nmcli connection delete Vlan2
nmcli connection delete Vlan3
# nmcli connection delete Bridge0
sleep 0.5
nmcli connection delete Bridge1
sleep 0.5
