nmcli connection add type bridge con-name Bridge0 ifname br0 ip4 172.20.99.101/24
nmcli connection add type bridge con-name Bridge1 ifname br1 ip4 172.20.99.102/24
sleep 0.5
nmcli connection add type vlan con-name Vlan2 ifname bond0.2 dev bond0 id 2 master br0 slave-type bridge
nmcli connection add type vlan con-name Vlan3 ifname bond0.3 dev bond0 id 3 master br1 slave-type bridge
nmcli connection add type bond con-name Bond0 ifname bond0 bond.options "mode=active-backup,miimon=100" ipv4.method disabled ipv6.method ignore
nmcli connection add type ethernet con-name Slave1 ifname eth1 master bond0 slave-type bond
nmcli connection add type ethernet con-name Slave2 ifname eth2 master bond0 slave-type bond
