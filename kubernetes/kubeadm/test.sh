export KUBECONFIG=/etc/kubernetes/admin.conf

sh deploy.sh
sh check.sh
sh ns1-date.sh

echo done
