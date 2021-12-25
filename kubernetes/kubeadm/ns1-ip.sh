kubectl exec pod/n1 -- apt-get update -qq
kubectl exec pod/n1 -- apt-get install iproute2 -qq
echo '-- host ip'
ip -4 -br a
echo '-- host route'
ip r
echo '-- host bridge'
bridge link
echo '-- pod/n1 ip'
kubectl exec pod/n1 -- ip -4 -br a
echo '-- pod/n1 route'
kubectl exec pod/n1 -- ip r
