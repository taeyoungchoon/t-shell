echo 1 > /proc/sys/net/ipv4/ip_forward
# make ns
ip netns add meg
ip netns add joe

# make cable
ip link add veth0 type veth peer name veth1
ip link add veth5 type veth peer name veth6

# cabling
ip link set veth1 netns meg
ip link set veth6 netns joe

# config
ip netns exec meg ip addr add 192.168.33.201/24 dev veth1
ip netns exec meg ip link set dev veth1 up

ip netns exec joe ip addr add 192.168.33.202/24 dev veth6
ip netns exec joe ip link set dev veth6 up

ip link set dev veth0 up
ip link set dev veth5 up


# make bridge
ip link add cbr0 type bridge
ip link set dev cbr0 up

# cabling to bridge
ip link set dev veth0 master cbr0
ip link set dev veth5 master cbr0



# make check
ip netns exec meg ip -4 a
ip netns exec joe ip -4 a
ip netns exec meg ping -c 1 192.168.33.202
ip netns exec joe ping -c 1 192.168.33.201

# make clean
ip netns del meg
ip netns del joe
ip link del cbr0
