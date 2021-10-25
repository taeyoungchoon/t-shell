all: help

help:
	@grep ^[a-z] makefile
check:
	vagrant status
status:
	vagrant status
m:
	vagrant up
nested:
	make halt
	sh nested.sh
	make m
up:
	vagrant up
halt:
	vagrant halt
ssh:
	vagrant ssh meg

post:
	sh enable.sh
clean:
	vagrant destroy -f
