ip link add bond0 type bond
ip link set bond0 type bond miimon 100 mode active-backup
ip link set eth1 down
ip link set eth1 master bond0
ip link set bond0 up

# ip link add br0 type bridge
# ip link set bond0.2 master br0
# ip link set br0 up
