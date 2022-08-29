all: help

help:
	cat makefile | grep ^[a-z

create:
	ansible-playbook -i inventory.ini create_topo.yml

remove:
	ansible-playbook -i inventory.ini remove_topo.yml
