nmcli connection
nmcli device
[[ -e /proc/net/bonding/service ]] && cat /proc/net/bonding/service | egrep "Slave|Mode"  
[[ -e /proc/net/bonding/rac ]] && cat /proc/net/bonding/rac | egrep "Slave|Mode"
[[ -e /proc/net/bonding/nas ]] && cat /proc/net/bonding/nas | egrep "Slave|Mode"
ip -br -4 a
route -n
