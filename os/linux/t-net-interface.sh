#!/usr/bin/env bash

# linux network interface show
#
# version: 0.0.2
# date: 2021.6.8
# written by t0spring

interfaces=$(ip -br link | awk '{ print $1 " " $2 }' | sort | cut -d " " -f 1)

echo interfaces : $interfaces
echo

for interface in $interfaces; do
    if [[ $interface =~ ^bond ]]; then
        echo bond : $interface
        ip -br link show master $interface | grep -v vnet | cut -d' ' -f 1
        echo
    fi
    if [[ $interface =~ ^br- ]]; then
        echo bridge : $interface
        ip -br link show master $interface | grep -v vnet | cut -d' ' -f 1
        echo
    fi
    if [[ $interface =~ ^vlan ]]; then
        echo vlan: $interface
        echo
    fi
done

which ovs-vsctl &>/dev/null
if ! [[ $? =~ 0 ]]; then
    exit 123;
fi

echo Open vSwitch report:
ovs-vsctl show | grep -i -e bridge -e port
