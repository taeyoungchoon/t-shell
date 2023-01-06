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

    done
}

function check {
    printf "* ip -br a\n\n"
    ip -br a
}

function clean {
    :
}

command=$2

if [[ $command =~ go ]]; then 
    go
elif [[ $command =~ check ]]; then
    check
else
    echo function:
    echo ---
    cat $0 | awk '/^function/ { print "- " $2 }'
fi