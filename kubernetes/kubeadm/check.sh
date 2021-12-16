export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl get all -n kube-system
kubectl get all
sleep 60
kubectl get all -n kube-system
kubectl get all
sleep 60
kubectl get all -n kube-system
kubectl get all

echo done
