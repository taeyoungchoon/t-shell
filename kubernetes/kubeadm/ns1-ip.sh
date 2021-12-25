kubectl exec pod/n1 -- apt-get update -y
kubectl exec pod/n1 -- apt-get install iproute2 -y
echo '-- host'
ip -4 -br a
ip r
bridge link
echo '-- pod/n1'
kubectl exec pod/n1 -- ip -4 -br a
kubectl exec pod/n1 -- ip r
