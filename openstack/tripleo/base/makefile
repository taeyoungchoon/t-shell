all: essential disable-selinux disable-ipv6

disable-selinux:
	sed -i 's/=enforcing/=permissive/' /etc/selinux/config
	setenforce Permissive
	# sestatus

disable-ipv6:
	cp disable-ipv6.conf /etc/sysctl.d/
	sysctl -p /etc/sysctl.conf
	# sysctl -a 2>/dev/null | grep disable_ipv6
	# ip a

essential: 
	yum install bash-completion bind-utils psmisc git -y
