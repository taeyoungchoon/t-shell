#!/usr/bin/env bash
#
# syntax: host.sh empas.com 8.8.8.8 4.4.4.4
# syntax: host.sh empas.com 
# syntax: host.sh 
#

function help {
    echo syntax: host.sh name servers
    exit 1
}

[[ -z $1 ]] && help

name=$1

shift

if [[ $# == 0 ]]; then 
    servers=(8.8.8.8 8.8.4.4)
else
    servers=$@
fi
    

for server in ${servers[@]};
do
	echo host $name $server
done
