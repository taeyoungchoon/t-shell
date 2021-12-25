kubectl exec pod/n1 -- apt-get update -qq
kubectl exec pod/n1 -- apt-get install jq -qq
kubectl exec pod/n1 -- apt-get install iproute2 -qq
#kubectl exec pod/n1 -- curl -s localhost
IP=`ip -j a | jq -r '.[] | select(.ifname == "eth0") | .addr_info[].local'`
kubectl exec pod/n1 -- curl -s $IP
