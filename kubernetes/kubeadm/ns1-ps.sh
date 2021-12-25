kubectl exec pod/n1 -- apt-get update
kubectl exec pod/n1 -- apt-get install procps
kubectl exec pod/n1 -- apt-get install psmisc
kubectl exec pod/n1 -- pstree
