nmcli connection
nmcli device
[[ -e /proc/net/bonding/service ]] && cat /proc/net/bonding/service | egrep "Slave|Mode"
