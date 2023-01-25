#!/usr/bin/env bash

[[ -e nic.env ]] && source nic.env || echo nic.env required

function help {
    cat $0 | awk '/^function/ { print "- " $2 }'
}

function script {

    if [[ ${mgmt[type]} =~ "nic" ]]; then
	echo nmcli con add type ethernet ifname ${mgmt[member1]} \
	     con-name mgmt
    fi

    if [[ ${backup[type]} =~ "nic" ]]; then
	echo nmcli con add type ethernet ifname ${backup[member1]} \
	     con-name backup
    fi

    if [[ ${service[type]} =~ "nic" ]]; then
	echo nmcli con add type bond ifname service \
	     mode 1 miimon 100 updelay 0 downdelay 0 \
	     con-name service

	echo nmcli con add type bond-slave ifname ${service[member1]} \
	     con-name service-slave-${service[member1]} \
	     master service
	echo nmcli con add type bond-slave ifname ${service[member2]} \
	     con-name service-slave-${service[member2]} \
	     master service
    fi   
}

function clean {

    if [[ ${mgmt[type]} =~ "nic" ]]; then
	echo nmcli con delete \
	     con-name mgmt
    fi

    if [[ ${backup[type]} =~ "nic" ]]; then
	echo nmcli con delete \
	     con-name backup
    fi

     if [[ ${service[type]} =~ "nic" ]]; then
	echo nmcli con delete \
	     con-name service
	echo nmcli con delete \
	     con-name service-slave-${service[member1]}
	echo nmcli con delete \
	     con-name service-slave-${service[member2]}
     fi
}

command=$1

if [[ $command =~ help ]]; then
    help
elif [[ $command =~ script ]]; then
    script
elif [[ $command =~ clean ]]; then
    clean
fi
