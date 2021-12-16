export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl get all -n kube-system
kubectl run n1 --image nginx
kubectl get all
sleep 60
kubectl get all -n kube-system
kubectl run n2 --image nginx
kubectl get all
sleep 60
kubectl get all -n kube-system
kubectl run n3 --image nginx
kubectl get all

echo done
