lanscan
ifconfig lan1
ifconfig lan2
netstat -ni
cat /etc/rc.config.d/netconf | grep -v ^#
/sbin/init.d/hostname stop
/sbin/init.d/hostname start
/sbin/init.d/net stop
/sbin/init.d/net start
ls /etc/rc.config.d/hpbtlanconf
ls /etc/resolv.conf
ls /sbin/init.d/net
ls /etc/hosts
# ifconfig lan9 192.168.0.100 netmask 255.255.255.0 up
# route add net 192.168.0.0 netmask 255.255.255.0 192.168.0.1 1
ioscan -fnk -C lan
man lanadmin
lanscan -q
ls /sbin/init.d/hostname
set_parms ipaddress
set_parms hostname
reboot
