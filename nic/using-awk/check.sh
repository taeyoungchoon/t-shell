#!/usr/bin/env bash

if which -s nmcli; then 

    nmcli connection
    nmcli device
    name=service; [[ -e /proc/net/bonding/$name ]] && echo $name && cat /proc/net/bonding/service | egrep "Slave I|Mode"  
    ip -br -4 a
    route -n
    ip a | awk '/^[0-9]/ { print $2, $4, $5 }'

else
    echo nmcli required
fi
