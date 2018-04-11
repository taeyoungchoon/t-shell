if [ $(which timedatectl) ] && [ $(timedatectl >/dev/null 2>/dev/null ) ]; then
	timedatectl
else
	exit 1
fi

<<COMMENT
timedatectl
yum install chrony -y
systemctl status chronyd
systemctl is-enabled chronyd
systemctl enable chronyd
systemctl is-active chronyd
systemctl start chronyd
timedatectl
COMMENT
