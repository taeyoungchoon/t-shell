kubectl exec pod/n1 -- apt-get update -qq
kubectl exec pod/n1 -- apt-get install iproute2 -qq
echo '-- host'
ip -4 -br a
ip r
bridge link
echo '-- pod/n1'
kubectl exec pod/n1 -- ip -4 -br a
kubectl exec pod/n1 -- ip r
