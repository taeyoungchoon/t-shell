#!/usr/bin/env bash

pkgs=( osinfo-db-import html2text )

for pkg in ${pkgs[@]}; do
    which $pkg &>/dev/null
    if [[ $? -eq 0 ]]; then
	echo $pkg installed already
    else
	apt-get install -qq $pkg
	echo $pkg installed now
    fi
done

