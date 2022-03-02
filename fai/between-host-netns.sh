ip netns add ns1
ip netns list

ip link add veth0 type veth peer name veth1
ip link show veth0

ip link set veth1 netns ns1
ip link show veth0
ip netns exec ns1 ip link show veth1

ip netns exec ns1 ip address add 1.1.1.2/24 dev veth1
ip netns exec ns1 ip link set veth1 up
ip netns exec ns1 ip link show veth1
ip netns exec ns1 ip address show veth1

ip address add 1.1.1.1/24 dev veth0
ip link set veth0 up
ip address show veth0

ping -c 3 1.1.1.2
ip netns exec ns1 ping -c 3 1.1.1.1

# clear
ip link del veth0
ip netns del ns1

