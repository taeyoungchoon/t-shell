all: help

help:
	cat makefile | grep ^[a-z]

pre:
	sudo yum -y install epel-release
	sudo yum -y install tree psmisc emacs-nox vim
	python --version
	sudo yum -y install python2-pip

python3:
	sudo yum -y install python3 
	sudo yum -y install python3-pip

env:
	pip3 install virtualenv --user; \
	mkdir ws1; \
	python3 -m virtualenv ws1; \
	source ws1/bin/activate; \
	pip3 install ansible;

check:
	python --version
	ansible --version
