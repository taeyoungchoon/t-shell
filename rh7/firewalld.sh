systemctl stop iptables ip6tables ebtables
systemctl mask iptables ip6tables ebtables
systemctl status iptables ip6tables ebtables

rpm -qi firewalld >/dev/null 2>/dev/null
if test $? -ne 0; then
        yum install firewalld
fi

systemctl is-enabled firewalld >/dev/null 2>/dev/null
if test $? -ne 0; then
        systemctl enable firewalld
fi

systemctl is-active firewalld >/dev/null 2>/dev/null
if test $? -ne 0; then
        systemctl start firewalld
fi

#firewall-cmd --list-all
echo 
echo default zone : 
firewall-cmd --get-default-zone

echo
echo active zones : 
firewall-cmd --get-active-zones

echo
echo listing all :
firewall-cmd --get-active-zones | grep ^[a-z] | sed 's/^/firewall-cmd --list-all --zone=/' | sh

yum install telnet nmap -y
