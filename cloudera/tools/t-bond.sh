# from red
nmcli con add type bond ifname bond0
nmcli con add type bond ifname bond0 bond.options "mode=balance-rr,miimon=100"
nmcli con add type ethernet ifname ens3 master bond0
nmcli con add type ethernet ifname ens7 master bond0
nmcli con up bond-slave-ens3
nmcli con up bond-slave-ens7

nmcli dev mod bond0 +bond.options "active_slave=ens7"
nmcli dev mod bond0 +bond.options "primary=ens3"

# from kr
nmcli d

nmtui

nmcli connection modify eth0 connection.autoconnect no
nmcli connection modify eth1 connection.autoconnect no
nmcli connection add type bond con-name bond0 ifname bond0 mode active-backup
nmcli connection add type bond-slave ifname eth0 master bond0
nmcli connection add type bond-slave ifname eth1 master bond0
nmcli connection modify bond0 ipv4.method manual connection.autoconnect yes ipv4.address 10.20.30.41/24 \
      ipv4.gateway 10.20.30.254 ipv4.dns "168.126.63.1 168.126.63.2"
nmcli connection modify bond0 +bond.options primary=eth0
nmcli connection modify bond0 +bond.options miimon=100
nmcli connection modify bond0 +bond.options updelay=0
nmcli connection modify bond0 +bond.options downdelay=0

lsmod | grep bonding
modprobe bonding
cat /etc/sysconfig/network-scripts/ifcfg=bond0

systemctl restart network
ip address

cat /proc/net/bonding/bond0

# about monitoring frequency 100ms

# more

ip link set down dev enp0s8
ip link show enp0s8
