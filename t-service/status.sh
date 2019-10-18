#!/usr/bin/env bash

declare -A brand
brand["active"]="running"
brand["inactive"]="dead"
brand["unknown"]="not installed"

declare -a services=('chronyd' 'atd')

for service in ${services[@]}; do
    status=$(systemctl is-active $service)
    echo $service ${brand[$status]}
done

