#!/usr/bin/env bash

source ./${0%.*}.env

function go {
    for interface in $( set | awk -F= '/bond[0-9]_ifname/ { print $2 }' ); do
	ifname=${interface}_ifname
	con_name=${interface}_con_name
	option=${interface}_option
	
	echo nmcli con add type bond ifname ${!ifname} con-name ${!con_name} ${!option}
	
	slave0_ifname=${interface}_slave0_ifname
	slave1_ifname=${interface}_slave1_ifname
	
	echo nmcli con add type bond-slave ifname ${!slave0_ifname} con-name ${!con_name}-slave-${!slave0_ifname} \
	     master ${!ifname}
	echo nmcli con add type bond-slave ifname ${!slave1_ifname} con-name ${!con_name}-slave-${!slave1_ifname} \
	     master ${!ifname}
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
