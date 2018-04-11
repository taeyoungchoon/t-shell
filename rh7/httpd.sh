rpm -qi httpd >/dev/null 2>/dev/null
if test $? -ne 0; then
	yum install httpd
fi

systemctl is-enabled httpd >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl enable httpd
fi

systemctl is-active httpd >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl start httpd
fi

systemctl status httpd

yum install mod_ssl mod_wsgi curl elinks telnet nmap -y

httpd -t
httpd -t -D DUMP_VHOSTS

ps -ef | grep httpd
ps -eZ | grep httpd

ss -lntp | grep httpd

firewall-cmd --permanent --add-service=http --add-service=https
firewall-cmd --reload
firewall-cmd --list-all

nmap localhost -p80,443

