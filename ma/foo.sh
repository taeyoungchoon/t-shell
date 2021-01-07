#!/usr/bin/env bash

HOST=${HOSTNAME}
DATE=$(date +%Y%m%d.%H%M)
YEAR=${DATE:0:4}
MONTH=${DATE:4:2}
DAY=${DATE:6:2}
HOUR=${DATE:9:2}
MINUTE=${DATE:11:2}
LOG=/tmp/SystemInfo_${HOST}_$DATE.txt
SIZE=$(stty size)
COLUMNS=${SIZE#* }
LINE=$(eval "for i in {1..$COLUMNS}; do printf -; done")
echo $YEAR $MONTH $DAY $HOUR $MINUTE $DATE $HOST $LOG
echo $SIZE $COLUMNS
echo $LINE
