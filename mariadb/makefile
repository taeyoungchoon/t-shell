all:
	@cat makefile | grep ^[a-z]*:

check:
	systemctl status mariadb

install:
	yum install mariadb-server mariadb -y

uninstall:
	yum remove mariadb-server -y

start:
	systemctl start mariadb

stop:
	systemctl stop mariadb
