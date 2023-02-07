#!/usr/bin/env awk -f

# name type ip nm gw
# service ip      192.168.101.41  255.255.255.0   192.168.101.252
# backup  ip      192.168.76.41   255.255.255.0   nil
# mgmt    ip      192.168.70.41   255.255.255.0   192.168.70.1
# 
# nmcli con mod service ipv4 2.2.2.100/24 gw4 2.2.2.1 ipv4.method manual
# nmcli con up service



$2 ~ /ip/ {
    name=$1
    type=$2
    ip=$3
    nm=$4
    gw=$5
    if ( gw !~ "nil") {
        print "nmcli con mod", name, "ipv4", ip "/" nm, "gw4", gw, "ipv4.method manual"
    }
    if ( gw ~ "nil") {
        print "nmcli con mod", name, "ipv4", ip "/" nm, "ipv4.method manual"
    }
}
