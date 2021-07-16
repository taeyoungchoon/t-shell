all: disable-selinux disable-ipv6 pkg timezone ntp

disable-selinux:
	@sed -i 's/=enforcing/=permissive/' /etc/selinux/config
	@setenforce Permissive

disable-ipv6:
	@cp -f disable-ipv6.conf /etc/sysctl.d/
	@sysctl --system &>/dev/null

pkg: 
	@yum -y -q install bash-completion bind-utils psmisc tmux bc
	@yum -y -q install vim emacs-nox 
	@yum -y -q install python-ethtool 

timezone:
	@timedatectl set-timezone Asia/Seoul

ntp:
	@yum -y -q install ntp ntpdate
	@systemctl -q is-enabled ntpd || systemctl -q enable ntpd
	@systemctl -q is-active ntpd || systemctl -q start ntpd

check: check-selinux check-ipv6 check-time

check-selinux:
	@sestatus | egrep 'SELinux status|Current mode'

check-ipv6:
	@sysctl -a --pattern disable_ipv6
	@ip -br a

check-time:
	@ntpq -pn
	@timedatectl | grep "Time zone"
	@date
