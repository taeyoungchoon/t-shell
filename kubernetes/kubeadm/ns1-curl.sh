kubectl exec pod/n1 -- apt-get update -y &>/dev/null
kubectl exec pod/n1 -- curl -s localhost
