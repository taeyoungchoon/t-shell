#!/usr/bin/env bash

function help {
    echo - clean
    echo - nic config
    echo - net config
    echo - check
    echo "- (opt) init"
    exit 1
}

[[ $# -eq 0 ]] && help

cmd=$1
config=$2

if   [[ $cmd =~ check ]]; then
    sh check.sh
elif [[ $cmd =~ clean ]]; then
    sh clean.sh
elif [[ $cmd =~ init ]]; then
    sh init.sh
elif [[ $cmd =~ nic ]]; then
    sh nic.sh $config
elif [[ $cmd =~ net ]]; then
    sh net.sh $config

fi
