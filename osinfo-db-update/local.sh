#!/usr/bin/env bash

targets=( system local user )

for target in ${targets[@]}; do
    version=$(osinfo-db-path --${target})/VERSION
    if [ -f $version ]; then
	value=$(cat $version)
	echo ${target} version: $value
    fi
done

