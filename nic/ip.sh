#!/usr/bin/env bash



# source ./${0%.*}.env
if [[ ! -e $1 ]]; then
    exit 1;
else
    source ./$1;
fi


function go {
    for interface in $( set | awk -F_ '/nic[0-9]_ip/ { print $1 }' ); do

	ip=${interface}_ip
	nm=${interface}_nm
	gw=${interface}_gw
	ns=${interface}_ns

	# https://unix.stackexchange.com/questions/523020/differance-between-ip4-and-ipv4-addresses-nmcli
	echo nmcli con mod $interface ip4 ${!ip}/${!nm} gw4 ${!gw} ipv4.method manual
	# echo nmcli con mod $interface ip4 "${!ns}"

	for s in ${!ns}; do
	    echo nmcli con mod $interface +ipv4.dns $s
	done

	printf "nmcli con up $interface\n"

    done
}

function check {
	
    printf "\n* nmcli device\n\n"
    nmcli device
    printf "\n* ip -br a\n\n"
    ip -br a
    printf "\n"
}

function clean {
    for interface in $( set | awk -F_ '/nic[0-9]_ip/ { print $1 }' ); do

	ip=${interface}_ip
	nm=${interface}_nm
	gw=${interface}_gw
	ns=${interface}_ns

	# https://unix.stackexchange.com/questions/523020/differance-between-ip4-and-ipv4-addresses-nmcli
	echo nmcli con mod $interface ipv4.dns \"\"
	echo nmcli con mod $interface ipv4.addresses \"\" ipv4.gateway \"\" ipv4.method disabled

	printf "nmcli con up $interface\n"
    done
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
