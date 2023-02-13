#!/usr/bin/env awk -f

#
# name type ip nm gw
# 

$1 !~ /^#/ && $2 ~ /ip/ {

    name=$1
    type=$2
    ip=$3
    nm=$4
    gw=$5
    
    if ( gw ~ /nil/ ) {
        print "nmcli con mod", name, "ipv4.addresses", ip "/" nm, "ipv4.method manual"
    } else {
        print "nmcli con mod", name, "ipv4.addresses", ip "/" nm, "gw4", gw, "ipv4.method manual"
    }
    print "nmcli con up", name
}
