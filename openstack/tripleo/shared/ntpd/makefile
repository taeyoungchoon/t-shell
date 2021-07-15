pre:
	yum install -y ntp ntpdate
start:
	systemctl is-enabled ntpd || systemctl enable ntpd
	systemctl is-active ntpd || systemctl start ntpd
stop:
	systemctl stop ntpd
check:
	ntpq -p
	ntpdate -q 127.0.0.1
