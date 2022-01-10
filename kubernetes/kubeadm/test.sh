export KUBECONFIG=/etc/kubernetes/admin.conf

sh deploy.sh
sh check.sh
sh n1-date.sh

echo done
