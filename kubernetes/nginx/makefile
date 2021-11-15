all: help

help:
	@cat makefile | grep ^[a-z] | grep -v all | grep -v help | cut -d: -f1 | sed 's/^/- /' 
check: pod log

pod:
	kubectl get pod jo -o wide
describe:
	kubectl describe pod jo
log:
	kubectl logs jo 
date:
	kubectl exec jo -- date
bash:
	kubectl exec -it jo -- bash
start:
	kubectl run jo --image nginx
apply:
	kubectl apply -f jo.yaml
stop:
	kubectl delete pod jo
shot:
	@make -s start
	# ---
	@make -s pod; sleep 1;
	# ---
	@make -s pod; sleep 3;
	# ---
	@make -s pod; 
	# ---
	@make -s log; 
	# ---
	@make -s date; 
	# ---
	@make -s stop
