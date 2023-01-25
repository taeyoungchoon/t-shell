#!/usr/bin/env bash

[[ -e nic.env ]] && source nic.env || echo nic.env required

function help {
    cat $0 | awk '/^function/ { print "- " $2 }'
}

function script {

    if [[ ${mgmt[type]} =~ "nic" ]]; then
	echo nmcli con mod mgmt ipv4 ${mgmt[ip]}/${mgmt[nm]} gw4 ${mgmt[gw]} ipv4.method manual
	[[ ! ${mgmt[ns1]} =~ "nil" ]] && echo nmcli con mod mgmt +ipv4.dns ${mgmt[ns1]}
	[[ ! ${mgmt[ns2]} =~ "nil" ]] && echo nmcli con mod mgmt +ipv4.dns ${mgmt[ns2]}
	echo nmcli con up mgmt
    fi

    if [[ ${backup[type]} =~ "nic" ]]; then
	echo nmcli con mod backup ipv4 ${backup[ip]}/${backup[nm]} gw4 ${backup[gw]} ipv4.method manual
	[[ ! ${backup[ns1]} =~ "nil" ]] && echo nmcli con mod backup +ipv4.dns ${backup[ns1]}
	[[ ! ${backup[ns2]} =~ "nil" ]] && echo nmcli con mod backup +ipv4.dns ${backup[ns2]}
	echo nmcli con up backup
    fi

    if [[ ${service[type]} =~ "nic" ]]; then
	echo nmcli con mod service ipv4 ${service[ip]}/${service[nm]} gw4 ${service[gw]} ipv4.method manual
	[[ ! ${service[ns1]} =~ "nil" ]] && echo nmcli con mod service +ipv4.dns ${service[ns1]}
	[[ ! ${service[ns2]} =~ "nil" ]] && echo nmcli con mod service +ipv4.dns ${service[ns2]}
	echo nmcli con up service
    fi
}

# nmcli con mod bond0 ipv4.dns ""
# nmcli con mod bond0 ipv4.addresses "" ipv4.gateway "" ipv4.method disabled

function clean {
    if [[ ${mgmt[type]} =~ "nic" ]]; then
	printf 'nmcli con mod mgmt ipv4.dns ""\n'
	printf 'nmcli con mod mgmt ipv4.addresses "" ipv4.gateway "" ipv4.method disabled\n'
	printf 'nmcli con up mgmt\n'
    fi

    if [[ ${backup[type]} =~ "nic" ]]; then
	printf 'nmcli con mod backup ipv4.dns ""\n'
	printf 'nmcli con mod backup ipv4.addresses "" ipv4.gateway "" ipv4.method disabled\n'
	printf 'nmcli con up backup\n'
    fi
    
    if [[ ${service[type]} =~ "nic" ]]; then
	printf 'nmcli con mod service ipv4.dns ""\n'
	printf 'nmcli con mod service ipv4.addresses "" ipv4.gateway "" ipv4.method disabled\n'
	printf 'nmcli con up service\n'
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
