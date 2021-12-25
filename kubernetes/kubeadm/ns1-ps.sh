kubectl exec pod/n1 -- apt-get update -y &>/dev/null
kubectl exec pod/n1 -- apt-get install procps -y &>/dev/null
kubectl exec pod/n1 -- apt-get install psmisc -y &>/dev/null
kubectl exec pod/n1 -- pstree -A -p
