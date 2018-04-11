rpm -qi postfix >/dev/null 2>/dev/null
if test $? -ne 0; then
	yum install postfix
fi

systemctl is-enabled postfix >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl enable postfix
fi

systemctl is-active postfix >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl start postfix
fi

systemctl status postfix

yum install telnet mailx mutt -y
