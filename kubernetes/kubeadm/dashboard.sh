export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
# kubectl apply -f dashboard-adminuser.yaml
# kubectl get sa -n kubernetes-dashboard
# kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
# kubectl proxy --port=8001 --address="192.168.56.100" --accept-hosts="^*$" & 
#
# http://192.168.56.100:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
# kubectl edit service kubernetes-dashboard -n kubernetes-dashboard
# NodePort
# kubectl -n kubernetes-dashboard delete serviceaccount admin-user
# kubectl -n kubernetes-dashboard delete clusterrolebinding admin-user
#
# https://journes.tistory.com/43
# https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
# https://kubernetes.io/docs/reference/kubectl/cheatsheet/

