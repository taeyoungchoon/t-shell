rpm -qi httpd >/dev/null 2>/dev/null
if test $? -ne 0; then
	yum install httpd -y
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

yum install mod_ssl mod_wsgi curl elinks telnet nmap -q -y

#read -p "Press enter to continue"

httpd -t
httpd -t -D DUMP_VHOSTS

ps -ef | grep httpd
ps -eZ | grep httpd

ss -lntp | grep httpd

firewall-cmd --permanent --add-service=http --add-service=https
firewall-cmd --reload
firewall-cmd --list-all

nmap localhost -p80,443

# and more
echo "hello" > /var/www/html/index.html
mkdir /var/www/html/owndir
echo "hello sub" > /var/www/html/owndir/index.html

mkdir -p /srv/vh1/www
mkdir -p /srv/vh2/www
