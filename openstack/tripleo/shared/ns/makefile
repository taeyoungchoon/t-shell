all: firewall pkg config activate check

firewall:
	@sh firewall.sh

pkg:
	@yum -y -q install bind bind-utils

config: config-allow config-add-zone config-add-db

config-allow:
	sed -i '/listen-on port 53/ s/127.0.0.1;/any;/' /etc/named.conf
	sed -i '/allow-query/ s/localhost;/any;/' /etc/named.conf

config-add-zone:
	if grep foo.com.zone /etc/named.conf; then
		echo 'zone file included'
	else
		echo 'include "/etc/named/foo.com.zone";' >> /etc/named.conf
	fi

config-add-db:
	cp -f foo.com.zone /etc/named/
	chown root.named /etc/named/foo.com.zone
	cp -f foo.com.db /var/named/
	chown root.named /var/named/foo.com.db

activate:
	systemctl -q is-enabled named || systemctl -q enable named
	systemctl -q is-active named  || systemctl -q start named

check: check-firewall check-named

check-firewall:
	firewall-cmd --list-services | grep -w dns

check-named:
	named-checkconf
	named-checkzone foo.com /var/named/foo.com.db
