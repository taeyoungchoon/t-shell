kubectl exec pod/n1 -- apt-get update -y
kubectl exec pod/n1 -- apt-get install iproute2 -y
ip -4 -br a
ip r
kubectl exec pod/n1 -- ip -4 -br a
kubectl exec pod/n1 -- ip r
