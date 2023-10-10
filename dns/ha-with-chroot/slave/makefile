help:
	cat makefile | grep ^[a-z]
install:
	yum install -y bind-chroot bind-utils
uninstall:
	yum remove -y bind-chroot bind-utils
remove: uninstall

backup:
	mkdir backup
	cp /etc/named.conf backup/named.conf-`date +%Y%m%d.%H%M%S`
conf:
	sed -i '/listen-on port/s/127.0.0.1/any/' /etc/named.conf
	sed -i '/allow-query/s/localhost/any/' /etc/named.conf
	cat /etc/named.conf | grep masterfile || sed -i '/allow-query/a \
        masterfile-format text;' /etc/named.conf
	grep t.com.zone /etc/named.conf || echo 'include "/etc/named/t.com.zone";' >> /etc/named.conf
zone:
	cp etc/named/t.com.zone /etc/named/
	cp _var/named/t.com.db /var/named/
start:
	systemctl start named-chroot
stop:
	systemctl stop named-chroot
restart: stop start

status:
	systemctl --no-pager status named-chroot
checkconf:
	named-checkconf
checkzone:
	named-checkzone t.com /var/named/t.com.db
check: checkconf checkzone
debug:
	dig +short @127.0.0.1 A foo.t.com
	dig +short @172.20.0.101 A foo.t.com
axfr:
	host -t axfr t.com 172.20.0.101
journal:
	echo journalctl -u named-chroot -f
reload:
	rndc reload
reload-t.com:
	rndc reload t.com
