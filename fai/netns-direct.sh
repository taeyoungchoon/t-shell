echo 1 > /proc/sys/net/ipv4/ip_forward

# make ns
ip netns add red
ip netns add blue

# make cable
ip link add veth0 type veth peer name veth1

# cabling
ip link set veth1 netns red
ip link set veth0 netns blue

# config
ip netns exec red ip addr add 192.168.33.201/24 dev veth1
ip netns exec red ip link set dev veth1 up

ip netns exec blue ip addr add 192.168.33.202/24 dev veth0
ip netns exec blue ip link set dev veth0 up

# make check
ip netns exec red ip -4 a
ip netns exec red ip r

ip netns exec blue ip -4 a
ip netns exec blue ip r

ip netns exec red ping -c 3 192.168.33.202
ip netns exec blue ping -c 3 192.168.33.201

# make clean
ip netns del red
ip netns del blue


