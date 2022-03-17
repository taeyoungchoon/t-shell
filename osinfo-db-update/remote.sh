#!/usr/bin/env bash

LOCATION=https://releases.pagure.org/libosinfo/
OUTPUT=libosinfo.out
curl -s -o /tmp/$OUTPUT $LOCATION

RECENT_FILE=`html2text /tmp/libosinfo.out   | grep osinfo-db-[0-9] | grep -v asc | tail -1 | awk '{ print $3 }'`
RECENT_VERSION=`echo $RECENT_FILE | cut -b 11-18`

echo recent version: $RECENT_VERSION

rm /tmp/$OUTPUT
