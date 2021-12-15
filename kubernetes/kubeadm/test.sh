export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl get all -n kube-system
kubectl run n1 --image nginx
sleep 60
kubectl get all -n kube-system
kubectl run n2 --image nginx
sleep 60
kubectl get all -n kube-system
kubectl run n3 --image nginx

echo done
