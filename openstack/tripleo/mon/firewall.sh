service='http'
if firewall-cmd --list-services | grep -w $service &>/dev/null; then
	echo "$service port opened";
else
	firewall-cmd --permanent --add-service=$service
	firewall-cmd --reload
fi
