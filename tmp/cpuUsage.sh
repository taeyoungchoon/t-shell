#!/bin/csh
#vmstat 3 3
echo wait 3 second
set unused=`top -d 3 | grep "CPU states" | tail -1 | awk '{ print $11 }' | cut -d '.' -f 1`
@ used = 100 - $unused
echo ${used}% use
