<<<<<<< HEAD
ifconfig
route -n
=======
ifconfig `netstat -rn | grep "UG" | awk '{ print $8 }'` | grep "inet addr" | awk '{ print $2 }' | cut -d ":" -f 2
#ifconfig
>>>>>>> 2f674346feda284768becb7c5f55f059710e0af7
