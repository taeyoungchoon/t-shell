#!/usr/bin/env bash

if which -s nmcli; then 
    
    nmcli -t -f name c | \
	while read name; do 
	    echo nmcli connection delete "$name"; 
	done

else
    echo nmcli required
fi
