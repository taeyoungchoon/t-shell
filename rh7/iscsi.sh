rpm -qi targetcli >/dev/null 2>/dev/null
if test $? -ne 0; then
	yum install targetcli
fi

systemctl is-enabled target >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl enable target
fi

systemctl is-active target >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl start target
fi

systemctl status target

yum install telnet -y

firewall-cmd --permanent --add-port=3260/tcp
firewall-cmd --reload
firewall-cmd --list-all
