all:

check:
	choco list --local | grep -i minikube && minikube status
install:
	choco install kubernetes-cli minikube kubernetes-helm
start:
	minikube start
go:
	minikube ip
	kubectl cluster-info
stop:
	minikube stop
clean:
	minikube delete
distclean:
	choco uninstall minikube kubernetes-cli kubernetes-helm
