if firewall-cmd --list-services | grep -w http &>/dev/null; then
	echo "$service port opened";
else
	firewall-cmd --permanent --add-service=http
	firewall-cmd --reload
fi
