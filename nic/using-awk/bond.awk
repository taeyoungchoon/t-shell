#!/usr/bin/env awk -f

# name type member1 member2

/pnic/ {
    print "nmcli con add type ethernet ifname", $1, "con-name", $1
}

/vnic/ {
    print "nmcli con add type bond ifname", $1, "con-name", $1
    print "nmcli con add type bond-slave ifname", $3, "con-name", $1 "-slave-" $3, "master", $1
    print "nmcli con add type bond-slave ifname", $4, "con-name", $1 "-slave-" $4, "master", $1
}

