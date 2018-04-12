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
