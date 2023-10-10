help:
	cat makefile | grep ^[a-z]
backup:
	mkdir backup
	cp /etc/named.conf backup/named.conf-`date +%Y%m%d.%H%M%S`
conf:
	sed -i '/listen-on port/s/127.0.0.1/any/' /etc/named.conf
	sed -i '/allow-query/s/localhost/any/' /etc/named.conf
