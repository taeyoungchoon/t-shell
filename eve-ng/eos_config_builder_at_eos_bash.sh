#!/usr/bin/env bash

ip=$1

if [[ -z $ip ]]; then
        exit;
fi

hn=v${ip##*.}

mac_old=$( Cli -c 'show interface management 1 | json' | awk -F'"' '/physicalAdd/ { print $4 }' )
mac_new="50:03$(printf $mac_old | cut -b 6-18)"

template=$(cat <<EOF
conf t
hostname HOSTNAME
clock timezone Asia/Seoul
ntp server 192.168.25.21
username admin secret admin
username mon secret admin
enable password admin
interface management 1
ip address IP/24
mac-address MAC
exit
ip route 0.0.0.0/0 192.168.25.1
exit
wr
EOF
)

echo "$template" | sed -e "s/HOSTNAME/$hn/" -e "s/IP/$ip/" -e "s/MAC/$mac_new/"
