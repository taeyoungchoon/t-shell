#!/bin/csh
set unused = `fw ctl pstat | grep Total | head -2 | tail -1 | awk '{ print $8 }' | cut -d "(" -f 2 | cut -d "." -f 1`
@ used = 100 - $unused
echo ${used}% used
