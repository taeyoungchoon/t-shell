#!/usr/bin/env bash

function activate {
	local port=$1

	if firewall-cmd --list-ports | grep -w $port &>/dev/null; then
		echo "$port port opened";
	else
		firewall-cmd --permanent --add-port=$port
		firewall-cmd --reload
	fi
}

for port in 53/tcp 53/udp; do
	activate $port
done
