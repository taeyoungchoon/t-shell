#!/usr/bin/env bash

source ./${0%.*}.env

function go {
    for interface in $( set | awk -F_ '/nic[0-9]_ip/ { print $1 }' ); do

	ip=${interface}_ip
	nm=${interface}_nm
	gw=${interface}_gw
	ns=${interface}_ns

	echo nmcli con mod con-name $interface ip4 ${!ip}/${!nm} gw4 ${!gw}	
	for s in ${!ns}; do
	    echo nmcli con mod con-name $interface ipv4.dns +$s
	done

    done
}

function check {
    :
}

function clean {
    :
}

command=$1

if [[ $command =~ go ]]; then 
    go
elif [[ $command =~ status ]]; then
    check
else
    echo function:
    echo ---
    cat $0 | awk '/^function/ { print "- " $2 }'
fi
