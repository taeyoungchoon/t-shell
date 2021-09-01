RM = rm

all: m

help:
	@cat makefile | grep ^[a-z] | sed -e 's/://' -e 's/^/- /'

m:
	vagrant up

ssh:
	sshpass -p vagrant ssh -l vagrant 10.0.99.100

clean:
	vagrant destroy -f

empty_trash:
	$(RM) *~
