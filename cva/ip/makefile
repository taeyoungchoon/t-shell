all: help
help:
	cat makefile | grep ^[a-z]
clean:
	ip link delete br0
	ip link delete bond0
down:
	ip link set eth1 down
	ip link set eth2 down
bond:
	ip link add bond0 type bond
	ip link set bond0 type bond miimon 100 mode active-backup
bind:
	ip link set eth1 master bond0
	ip link set eth2 master bond0
up:
	ip link set bond0 up
network:
	ip addr add 172.20.0.201/24 dev bond0
	# ip route add default vis 172.20.0.1
check:
	ip -br a
	ls /proc/net/bonding/
	brctl show
bridge:
	ip link add br0 type bridge
	ip link set bond0 master br0
	ip link set br0 up
