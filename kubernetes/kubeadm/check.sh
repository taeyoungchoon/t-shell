export KUBECONFIG=/etc/kubernetes/admin.conf

echo kubectl get sa ------------------------
kubectl get sa

echo kubectl get all -n kube-system --------
kubectl get all -n kube-system

echo kubectl get all -----------------------
kubectl get all

echo done
