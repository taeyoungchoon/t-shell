<<<<<<< HEAD
command=$1
case $command in
	pre)
		systemctl status iptables ip6tables ebtables
		systemctl stop iptables ip6tables ebtables
		systemctl mask iptables ip6tables ebtables
		;;
	enable)
		systemctl unmask firewalld
		systemctl is-enabled firewalld
		systemctl enable firewalld
		systemctl is-active firewalld
		systemctl start firewalld
		;;
	check|chk)
		firewall-cmd --list-all
		;;
	*)
		echo help
		cat $0 | grep \) | grep -v grep
		;;
esac

<<COMMENT

COMMENT
=======
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
>>>>>>> 1634bef8cb0c20f7b2e5af076aacd6ba6cab953f
