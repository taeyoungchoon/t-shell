RM = rm

all: m

help:
	@cat makefile | grep ^[a-z] | sed -e 's/://' -e 's/^/- /'

m:
	vagrant up

ssh:
	@echo 'sshpass -p vagrant ssh -l vagrant 10.0.99.100'
	@echo 'sudo su - stack'
	@echo 'cd as-stack/devstack'
	@echo 'vi local.conf'
	@echo 'make unstack; make clean; make stack'

clean:
	vagrant destroy -f

empty_trash:
	$(RM) *~
