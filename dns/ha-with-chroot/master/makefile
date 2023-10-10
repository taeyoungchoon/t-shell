help:
	cat makefile | grep ^[a-z]
backup:
	mkdir backup
	cp /etc/named.conf backup/named.conf-`date +%Y%m%d.%H%M%S`
conf:
	sed -i '/listen-on port/s/127.0.0.1/any/' /etc/named.conf
	sed -i '/allow-query/s/localhost/any/' /etc/named.conf
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
journal:
	echo journalctl -u named-chroot -f &
