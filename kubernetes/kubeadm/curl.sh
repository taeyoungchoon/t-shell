# curl $(ip -o -4 -j address show eth0 | jq -r '.[] | .addr_info[].local')
IP=$(ip -o -4 -j address show eth0 | jq -r '.[] | .addr_info[].local')
echo ip: $IP
echo curl -s $IP
curl -s -i $IP | grep 'Length'
curl -s $IP | egrep 'title.*Welcome to nginx'
