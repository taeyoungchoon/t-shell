#!/usr/bin/env bash

# this is the bash
# in a page
#
# and about : general
# later on : $1 $2

echo '$1 :' $1

file=~/.bash_profile
echo $file
echo ${file}
echo ${file/pro}

if [[ -e $file ]]; then
    echo $(basename $file) exist;
fi

if [[ -x $file ]]; then
    echo $(basename $file) is the executable file;
else
    echo $(basename $file) is not executable file;
fi

for item in $(seq 1 2) haha hoho $(seq 5 6); do
    echo $item;
done

declare -i count
count=0

while true; do
    echo $(date);
    echo count : $count
    ((count = count + 1))
    sleep 1;
    if [[ $count -eq 3 ]]; then
	break;
    fi
done

echo -e '\nfine\n'

