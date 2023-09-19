#!/usr/bin/env bash

services=(chronyd iptables)

for service in "${services[@]}"; do
    printf -v cmd_string 'systemctl --no-pager status %s' $service
    eval $cmd_string
done
