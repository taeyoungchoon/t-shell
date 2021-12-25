kubectl exec pod/n1 -- apt-get update -y
kubectl exec pod/n1 -- apt-get install procps -y
kubectl exec pod/n1 -- apt-get install psmisc -y
kubectl exec pod/n1 -- pstree -A -p
