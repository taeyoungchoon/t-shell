all: help

help:
	@cat makefile | grep ^[a-z] | grep -v all | grep -v help | sed -e 's/://' -e 's/^/- /'
check: check-pod log

check-pod:
	kubectl get pod jo
log:
	kubectl logs jo 
date:
	kubectl exec jo -- date
bash:
	kubectl exec -it jo -- bash
start:
	kubectl run jo --image nginx
stop:
	kubectl delete pod jo
shot:
	@make -s start
	# ---
	@make -s check-pod; sleep 1;
	# ---
	@make -s check-pod; sleep 3;
	# ---
	@make -s check-pod; 
	# ---
	@make -s log; 
	# ---
	@make -s date; 
	# ---
	@make -s stop
