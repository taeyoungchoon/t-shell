all: firewall pkg check

firewall:
	@sh firewall.sh

pkg:
	@yum -y -q install bind bind-utils

config:
	sed -i '/listen-on port 53/ s/127.0.0.1;/any;/' /etc/named.conf
	sed -i '/allow-query/ s/localhost;/any;/' /etc/named.conf

	if grep foo.com.zone /etc/named.conf; then
		echo 'zone file included'
	else
		echo 'include "/etc/named/foo.com.zone";' >> /etc/named.conf
	fi

	cp -f foo.com.zone /etc/named/
	cp -f foo.com.db   /var/named/

activate:
	systemctl -q is-enabled named || systemctl -q enable named
	systemctl -q is-active named  || systemctl -q start named

check: check-firewall check-named

check-firewall:
	firewall-cmd --list-services | grep -w dns

check-named:
	named-checkconf
	named-checkzone foo.com /var/named/foo.com.db
