ifconfig `netstat -rn | grep "UG" | awk '{ print $8 }'` | grep "inet addr" | awk '{ print $2 }' | cut -d ":" -f 2
#ifconfig
