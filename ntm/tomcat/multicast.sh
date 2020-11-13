cp route-eth1 /etc/sysconfig/network-scripts/
ifdown eth1
ifup eth0
ifup eth1
ip r
netstat -ng
