all:
	@cat makefile | grep ^[a-z]*:

check:
	grep cache_dir /etc/squid/squid.conf
	du -hs /var/spool/squid
	systemctl status squid
	ss -lntup | grep squid | grep 3128

install:
	yum install squid -y

config:
	cp /etc/squid/squid.conf squid.conf.orig
	sh config.sh
	\cp squid.conf.mod /etc/squid/squid.conf

uninstall:
	yum remove squid -y

start:
	systemctl start squid

stop:
	systemctl stop squid

clean:
	rm squid.conf*
