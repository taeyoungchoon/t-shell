firewall-cmd --permanent --add-rich-rule='rule family=ipv4 source address=192.168.33.200 forward-port port=8080 protocol=tcp to-port=80'
firewall-cmd --reload
firewall-cmd --list-all
<<COMMENT
route -n
ip route
ip addr
firewall-cmd --add-rich-rule='rule family=ipv4 forward-port port=8080 protocol=tcp to-port=80'

# man firewalld.richlanguage | grep to-port
           forward-port port="port value" protocol="tcp|udp" to-port="port value" to-addr="address"
           rule family="ipv6" source address="1:2:3:4:6::" forward-port to-addr="1::2:3:4:7" to-port="4012" protocol="tcp" port="4011"
COMMENT
