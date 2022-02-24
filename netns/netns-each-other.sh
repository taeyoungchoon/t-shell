echo 1 > /proc/sys/net/ipv4/ip_forward

ip netns add joe
ip netns add meg

ip link add cable0 type veth peer name cable1

printf "\n*** host network stack status\n\n"
ip -br link show type veth

ip link set cable0 netns joe
ip netns exec joe ip addr add 192.168.0.201/24 dev cable0
ip netns exec joe ip link set dev cable0 up

ip link set cable1 netns meg
ip netns exec meg ip addr add 192.168.0.202/24 dev cable1
ip netns exec meg ip link set dev cable1 up

printf "\n*** netns network stack status, each\n\n"
printf "\n***** netns network stack status, joe\n\n"
ip netns exec joe ip -4 -br a

printf "\n***** netns network stack status, meg\n\n"
ip netns exec meg ip -4 -br a

printf "\n*** netns network stack check, each\n\n"
ip netns exec joe ping -q -c 1 192.168.0.202  | grep loss
ip netns exec meg ping -q -c 1 192.168.0.201 | grep loss

# make clean
ip netns del joe
ip netns del meg


