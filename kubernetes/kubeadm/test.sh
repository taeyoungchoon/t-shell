export KUBECONFIG=/etc/kubernetes/admin.conf

sh deploy.sh
sh check.sh
sh n1-date.sh
sh n1-ps.sh
sh n1-ip.sh
sh n1-curl.sh

echo done
