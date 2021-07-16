if ntpdc -n -c 'reslist -4' | grep -w 192.168.25.0 &>/dev/null; then
	echo "192.168.25.0 are less restricted";
else
	sed -i '/#restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap/ a \
restrict 192.168.25.0 mask 255.255.255.0 nomodify notrap' /etc/ntp.conf;
fi

if ntpdc -n -c 'reslist -4' | grep -w 172.20.99.0 &>/dev/null; then
	echo "172.20.99.0 are less restricted";
else
	sed -i '/#restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap/ a \
restrict 172.20.99.0 mask 255.255.255.0 nomodify notrap' /etc/ntp.conf;
fi

