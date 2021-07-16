#!/usr/bin/env bash

function activate_port {
	local port=$1

	if firewall-cmd --list-ports | grep -w $port &>/dev/null; then
		echo "$port port opened";
	else
		firewall-cmd --permanent --add-port=$port -q
		firewall-cmd --reload -q
	fi
}

# for port in 53/tcp 53/udp; do
# 	activate_port $port
# done

function activate_service {
        local service=$1

	if firewall-cmd --list-services | grep -w $service &>/dev/null; then
		echo "$service service opened";
	else
		firewall-cmd --permanent --add-service=$service -q
		firewall-cmd --reload -q
	fi
}

for service in dns; do
	activate_service $service
done
