#!/usr/bin/env awk -f

# name type member1 member2

$2 ~ /pnic/ {
    name=$1
    type=$2
    member1=$3
    member2=$4
    mtu=$5
    if ( mtu ~ /nil/ ) {
	print "nmcli c add type ethernet ifname", member1, "con-name", name
    } else {
	print "nmcli c add type ethernet ifname", member1, "con-name", name, "802-3-ethernet.mtu", mtu
    }
}

$2 ~ /vnic/ {
    name=$1
    type=$2
    member1=$3
    member2=$4
    mtu=$5
    if ( mtu ~ /nil/ ) {
	print "nmcli c add type bond ifname", name, "con-name", name
    } else {
	print "nmcli c add type bond ifname", name, "con-name", name, "802-3-ethernet.mtu", mtu
    }
    print "nmcli c add type bond-slave ifname", member1, "con-name", name "-slave-" member1, "master", name
    print "nmcli c add type bond-slave ifname", member2, "con-name", name "-slave-" member2, "master", name
}
