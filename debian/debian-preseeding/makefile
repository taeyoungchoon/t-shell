all: help

help:
	@cat makefile | grep ^[a-z]
network33:
	virsh net-start network33
m:
	bash i.sh d01
start:
	virsh start d01
stop:
	virsh destory d01
console:
	virsh console d01
ssh:
	ssh-keygen -R 192.168.33.250
	sshpass -p 1234qwer ssh -o "StrictHostKeyChecking no" jack@192.168.33.250
uptime:
	ssh-keygen -R 192.168.33.250
	sshpass -p 1234qwer ssh -o "StrictHostKeyChecking no" jack@192.168.33.250 uptime
status:
	virsh list --all
clean:
	bash clean.sh
