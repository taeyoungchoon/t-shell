#
# AIX
#
# echo "idle"; echo "----"; vmstat 1 4 | tail -3 | awk '{ print $16 }'
echo "idle"; echo "----"; vmstat 1 4 | tail -3 | awk '{ print $18 }'
echo " "
echo "mem used"; echo "--------"; /usr/sbin/swapinfo -m | egrep "(Mb|TYPE|memory)" | grep memory | awk '{ print $5 }'
echo " "
df -Pk | egrep "(9[0-9]|100)%"
if [ -f .daily.note ]; then cat .daily.note; fi
