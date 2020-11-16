#!/usr/bin/env bash

rpm -qa nginx | grep nginx >/dev/null 2>/dev/null
if test $? -eq 0; then
    echo "installed"
else
    echo "not installed"
fi

systemctl -q is-active nginx 
if test $? -eq 0; then
    echo "working"
else
    echo "not working"
fi

systemctl -q is-enabled nginx 2>/dev/null
if test $? -eq 0; then
    echo "registered to start at boot time"
else
    echo "not registered to start at boot time"
fi
