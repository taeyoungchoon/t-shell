all: env

env: up

help:
	@cat makefile | grep ^[a-z]
check:
	vagrant status
up:
	vagrant up meg
ssh:
	vagrant ssh meg
clean:
	vagrant destroy -f meg
