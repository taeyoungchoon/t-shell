#!/usr/bin/env bash

function help {
    # cat $0 | awk '/^function/ { print "- " $2 }'
    echo check
}

[[ ! -e $1 ]] && help

command=$1
config=$2

if [[ $command =~ help ]]; then
    help
elif [[ $command =~ check ]]; then
    sh check.sh
elif [[ $command =~ clean ]]; then
    sh clean.sh
elif [[ $command =~ init ]]; then
    sh init.sh
elif [[ $command =~ nic ]]; then
    sh nic.sh $config
elif [[ $command =~ net ]]; then
    sh net.sh $config

fi
