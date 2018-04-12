command=$1
case $command in
	pre)
		for service in iptables ip6tables ebtables;
		do
			systemctl list-unit-files | grep -w $service |  grep -E "(enabled|disabled)"
			if test $? -eq 0; then
				systemctl stop $service
				systemctl mask $service
			fi
		done
		;;
	enable)
		rpm -qi firewalld >/dev/null 2>/dev/null
		if test $? -ne 0; then
			yum install firewalld -y
		fi
		systemctl unmask firewalld
		systemctl is-enabled firewalld >/dev/null 2>/dev/null
		if test $? -ne 0; then
			systemctl enable firewalld
		fi
		systemctl enable firewalld >/dev/null 2>/dev/null
		if test $? -ne 0; then
			systemctl start firewalld
		fi
		
		systemctl is-active firewalld >/dev/null 2>/dev/null
		if test $? -ne 0; then
			systemctl start firewalld
		fi

		echo firealld enabled
		;;
	disable)
		systemctl stop firewalld
		systemctl disable firewalld
		# rpm -e firewalld

		echo firealld disabled
		;;
	check|chk)
		rpm -qi telnet nmap >/dev/null 2>/dev/null
		if test $? -ne 0; then
			yum install telnet nmap -y
		fi
		
		echo
		echo default zone : 
		firewall-cmd --get-default-zone

		echo
		echo active zones : 
		firewall-cmd --get-active-zones

		echo
		echo list all based on zone :
		firewall-cmd --get-active-zones | grep ^[a-z] | sed 's/^/firewall-cmd --list-all --zone=/' | sh

		echo
		echo proc : 
		ps -ef | grep firewalld | grep -v grep

		echo
		echo proc with selinux :
		ps -eZ | grep firewalld | grep -v grep
		;;
	*)
		echo help
		cat $0 | grep \) | grep -v grep
		;;
esac

<<COMMENT

no comment

COMMENT
