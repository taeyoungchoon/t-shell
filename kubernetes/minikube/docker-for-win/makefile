all:

check:
	choco list --local | grep -i docker-cli && docker ps
install:
	choco install docker-cli
env:
	echo 'eval $$(minikube.exe -p minikube docker-env)' >> ~/.bashrc
	source ~/.bashrc
	docker ps
	@echo 'type source ~/.bashrc'
clean:
	choco uninstall docker-cli
