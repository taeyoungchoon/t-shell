all: fireall pkg start check

firewall:
	sh firewall.sh

pkg:
	yum install -y ntp ntpdate
start:
	@systemctl is-enabled ntpd &>/dev/null || systemctl enable ntpd
	@systemctl is-active ntpd &>/dev/null  || systemctl start ntpd
stop:
	systemctl stop ntpd
check:
	ntpq -p
	ntpdate -q 127.0.0.1
less-restricted:
	sh less-restricted.sh
	systemctl restart ntpd
