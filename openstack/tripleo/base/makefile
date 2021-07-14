all: essential disable-selinux disable-ipv6

disable-selinux:
	@sed -i 's/=enforcing/=permissive/' /etc/selinux/config
	@setenforce Permissive
	@sestatus | egrep 'SELinux status|Current mode'

disable-ipv6:
	@cp -f disable-ipv6.conf /etc/sysctl.d/
	@sysctl --system &>/dev/null
	@sysctl -a --pattern disable_ipv6
	@ip -br a

essential: 
	@yum install -y bash-completion bind-utils psmisc 
	@yum install -y vim emacs-nox 
	@yum install -y python-ethtool 

timezone:
	@timedatectl set-timezone Asia/Seoul
	@date

ntp:
	@yum install ntp ntpdate -y
	@systemctl enable ntpd
	@systemctl start ntpd
	@ntpq -p
