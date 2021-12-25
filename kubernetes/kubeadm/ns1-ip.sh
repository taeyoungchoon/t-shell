kubectl exec pod/n1 -- apt-get update -y
kubectl exec pod/n1 -- apt-get install iproute2 -y
kubectl exec pod/n1 -- ip a
kubectl exec pod/n1 -- ip r
