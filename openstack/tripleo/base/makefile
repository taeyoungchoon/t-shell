all: essential disable-selinux disable-ipv6

disable-selinux:
	sed -i 's/=enforcing/=permissive/' /etc/selinux/config
	setenforce Permissive
	sestatus | egrep 'SELinux status|Current mode'

disable-ipv6:
	cp -f disable-ipv6.conf /etc/sysctl.d/
	sysctl --system
	sysctl -a --pattern disable_ipv6
	pifconfig

essential: 
	yum install bash-completion bind-utils psmisc emacs-nox python-ethtool -y

check: