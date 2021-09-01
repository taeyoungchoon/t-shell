RM = rm

all: m

help:
	@cat makefile | grep ^[a-z] | sed -e 's/://' -e 's/^/- /'

m:
	vagrant up

clean:
	vagrant destroy -f

empty_trash:
	$(RM) *~
