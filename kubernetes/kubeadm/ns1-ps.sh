kubectl exec pod/n1 -- apt-get update -qq
kubectl exec pod/n1 -- apt-get install procps -qq
kubectl exec pod/n1 -- apt-get install psmisc -qq
kubectl exec pod/n1 -- pstree -A -p
