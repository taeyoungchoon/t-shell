ovs:
	sh enable-openvswitch.sh
nic:
	cp ifcfg-* /etc/sysconfig/network-scripts/
	systemctl restart network
chk:
	systemctl status openvswitch
	ovs-vsctl list-br
	ovs-vsctl list-br
	ovs-vsctl show
	ping -c 3 8.8.8.8 
	ping -c 3 172.20.99.110


