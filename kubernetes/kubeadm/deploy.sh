export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl run n1 --image nginx
kubectl run n2 --image nginx
kubectl run n3 --image nginx

echo done
