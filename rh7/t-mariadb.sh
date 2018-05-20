rpm -qi mariadb-server mariadb >/dev/null 2>/dev/null
if test $? -ne 0; then
	yum install mariadb-server mariadb -y
fi

systemctl is-enabled mariadb >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl enable mariadb
fi

systemctl is-active mariadb >/dev/null 2>/dev/null
if test $? -ne 0; then
	systemctl start mariadb
fi

systemctl status mariadb

yum install telnet nmap -y

# read -p "Press enter to continue"

ps -ef | grep mariadb
ps -eZ | grep mariadb

ss -lntp | grep mariadb
nmap localhost -p3306

firewall-cmd --permanent --add-service=mysql
firewall-cmd --reload
firewall-cmd --list-all
