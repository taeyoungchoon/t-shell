if grep 'restrict 192.168.25.0 mask 255.255.255.0 nomodify notrap' /etc/ntp.conf &>/dev/null; then
	echo "192.168.25.0 are less restricted";
else
	sed -i '/#restrict 192.168.1.0 mask 255.255.255.0 nomodify notrap/ a \
restrict 192.168.25.0 mask 255.255.255.0 nomodify notrap' /etc/ntp.conf;
fi
