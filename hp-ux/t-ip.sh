# netstat -rn
# ifconfig lan900

ifconfig `netstat -rn | grep UG | awk '{ print $5 }'` | grep inet | awk '{ print $2 }'
