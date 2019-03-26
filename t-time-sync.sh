#!/usr/bin/env bash

ps -ef | grep ntpd
returncode=$0

if [[ $returncode == 0 ]]; then 
    ntpdate -Bb time.bora.net
    /etc/init.d/ntpd start
fi
