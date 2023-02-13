#!/usr/bin/env awk -f

#
# name type member1 member2 mtu
#

$1 !~ /^#/ && $2 ~ /pnic/ {

    name=$1
    type=$2
    member1=$3
    member2=$4
    mtu=$5

    print "nmcli con add type ethernet ifname", member1, "con-name", name
}

$1 !~ /^#/ && $2 ~ /vnic/ {
    
    name=$1
    type=$2
    member1=$3
    member2=$4
    mtu="9000"
    options="mode 1 miimon 100 updelay 0 downdelay 0"
    
    if ( name ~ /rac/ ) {
	print "nmcli con add type bond ifname", name, "con-name", name, "802-3-ethernet.mtu", mtu, options
    } else {
	print "nmcli con add type bond ifname", name, "con-name", name, options
    }
    profile1=name "-slave-" member1
    print "nmcli con add type bond-slave ifname", member1, "con-name", profile1, "master", name
    profile2=name "-slave-" member2
    print "nmcli con add type bond-slave ifname", member2, "con-name", profile2, "master", name
}
