#!/usr/bin/env bash

osinfo-query --fields=short-id os vendor="Debian Project" | \
    grep -v Short | grep -v \- | sed 's/ debian//' | sort -n
