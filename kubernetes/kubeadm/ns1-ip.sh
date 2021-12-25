kubectl exec pod/n1 -- apt-get update -y &>/dev/null
kubectl exec pod/n1 -- apt-get install iproute2 -y &>/dev/null
echo '-- host'
ip -4 -br a
ip r
bridge link
echo '-- pod/n1'
kubectl exec pod/n1 -- ip -4 -br a
kubectl exec pod/n1 -- ip r
