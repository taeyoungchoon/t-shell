kubectl exec pod/n1 -- apt-get update -qq
kubectl exec pod/n1 -- apt-get install jq -qq
kubectl exec pod/n1 -- apt-get install iproute2 -qq
kubectl cp curl.sh n1:/
kubectl exec pod/n1 -- sh curl.sh
