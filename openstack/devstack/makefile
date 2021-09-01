RM = rm

help:
	@cat makefile | grep ^[a-z] | sed -e 's/://' -e 's/^/- /'

all:

m:
	vagrant up

clean:
	vagrant destroy -f

empty_trash:
	$(RM) *~
