#!/usr/bin/env awk -f

# name type member1 member2

/pnic/ {
    name=$1
    type=$2
    member1=$3
    member2=$4
    print "nmcli con add type ethernet ifname", member1, "con-name", name
}

/vnic/ {
    name=$1
    type=$2
    member1=$3
    member2=$4
    print "nmcli con add type bond ifname", name, "con-name", name
    print "nmcli con add type bond-slave ifname", member1, "con-name", name "-slave-" member1, "master", name
    print "nmcli con add type bond-slave ifname", member2, "con-name", name "-slave-" member2, "master", name
}
