#!/usr/bin/env bash

# abort 'openstack baremetal introspection' task

status=$(openstack baremetal introspection list -f value -c 'Finished at')

if [[ $status =~ 'None' ]]; then
    echo 'doing stop';
    openstack baremetal introspection abort $(openstack baremetal introspection list -f value -c UUID);
else
    echo 'nothing to do';
fi
