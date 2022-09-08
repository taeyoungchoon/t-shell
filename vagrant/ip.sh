ip link add bond0 type bond
ip link set bond0 type bond miimon 100 mode active-backup
ifdown eth1
ip link set eth1 down
ip link set eth1 master bond0
ip addr add 172.20.0.201/24 dev bond0
ip link set bond0 up

# ip link add br0 type bridge
# ip link set bond0.2 master br0
# ip link set br0 up

# https://blog.dbrgn.ch/2014/1/14/setting_static_ip_with_iproute2/

ip route add default vis 172.20.0.1
