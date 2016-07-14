echo "idle"; echo "----"; vmstat 1 4 | tail -3 | awk '{ print $16 }'
echo " "
errpt | head -10
echo " "
df -Pk | egrep "(9[0-9]|100)%"
if [ -f .daily.note ]; then cat .daily.note; fi


