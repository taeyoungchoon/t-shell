ls:
	cat makefile | grep ^[a-z]*:

install:
	yum install mariadb -y

check:
	rpm -qa | grep mariadb
	systemctl status mariadb

uninstall:
	yum remove mariadb -y

clean:
	yum remove mariadb -y

status:
	systemctl status mariadb

start:
	systemctl start mariadb
	systemctl status mariadb
stop:
	systemctl stop mariadb
	systemctl status mariadb
