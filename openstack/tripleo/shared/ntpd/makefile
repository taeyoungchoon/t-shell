all: firewall pkg start check

firewall:
	sh firewall.sh

pkg:
	yum -y -q install ntp ntpdate

start:
	@systemctl -q is-enabled ntpd  || systemctl -q enable ntpd
	@systemctl -q is-active ntpd   || systemctl -q start ntpd

stop:
	systemctl stop ntpd

check:
	ntpq -p
	ntpdate -q 127.0.0.1

less-restricted:
	sh less-restricted.sh
	systemctl -q restart ntpd
