#!/usr/bin/env bash

LOCATION=https://releases.pagure.org/libosinfo/
OUTPUT=libosinfo.out
curl -s -o /tmp/$OUTPUT $LOCATION

RECENT_FILE=`html2text /tmp/libosinfo.out   | grep osinfo-db-[0-9] | grep -v asc | tail -1 | awk '{ print $3 }'`
RECENT_VERSION=`echo $RECENT_FILE | cut -b 11-18`

DOWNLOAD_LINK=${LOCATION}${RECENT_FILE}
curl -s -o /tmp/${RECENT_FILE} $DOWNLOAD_LINK
echo download file from $DOWNLOAD_LINK

osinfo-db-import /tmp/${RECENT_FILE}
echo import done

rm /tmp/$OUTPUT
rm /tmp/${RECENT_FILE}
