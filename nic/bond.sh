#!/usr/bin/env bash



# source ./${0%.*}.env
if [[ ! -e $1 ]]; then 
    exit 1; 
else
    source ./$1;
fi

function go {

    for interface in $( set | awk -F= '/bond[0-9]_ifname/ { print $2 }' ); do
	ifname=${interface}_ifname
	con_name=${interface}_con_name
	declare -n option=${interface}_option
	
	echo nmcli con add type bond ifname ${!ifname} \
	     con-name ${!con_name} \
	     ${option}
	
	slave0_ifname=${interface}_slave0_ifname
	slave1_ifname=${interface}_slave1_ifname
	
	echo nmcli con add type bond-slave ifname ${!slave0_ifname} \
	     con-name ${!con_name}-slave-${!slave0_ifname} \
	     master ${!ifname}
	echo nmcli con add type bond-slave ifname ${!slave1_ifname} \
	     con-name ${!con_name}-slave-${!slave1_ifname} \
	     master ${!ifname}
    done
}

function check {

    printf "\n* nmcli connection\n\n"
    nmcli connection

    printf "\n* nmcli device\n\n"
    nmcli device

    for interface in /proc/net/bonding/*; do
	if [ ! -e $interface ]; then
	    break;
	    # exit 1;
	else
	    printf "\n* status of bond interface $interface\n\n"
	    cat $interface | egrep "Bonding Mode|Slave Interface"
	fi
    done
    printf "\n"
}

function clean {

    for interface in $( set | awk -F= '/bond[0-9]_ifname/ { print $2 }' ); do
	ifname=${interface}_ifname
	con_name=${interface}_con_name
	# option=${interface}_option
	declare -n option=${interface}_option
	
	echo nmcli con delete ${!con_name}
		
	slave0_ifname=${interface}_slave0_ifname
	slave1_ifname=${interface}_slave1_ifname
	
	echo nmcli con delete ${!con_name}-slave-${!slave0_ifname}
	echo nmcli con delete ${!con_name}-slave-${!slave1_ifname}
    done
   :
}

command=$2

if [[ $command =~ go ]]; then 
    go
elif [[ $command =~ check ]]; then
    check
elif [[ $command =~ clean ]]; then
    clean
else
    echo function:
    echo ---
    cat $0 | awk '/^function/ { print "- " $2 }'
fi
