all: help

help:
	@cat makefile | grep ^[a-z]

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
	. ws1/bin/activate; \
	pip3 install jsonrpclib; \
	pip3 install pyeapi; \
	pip3 install ansible; \
	pip3 install cvprac; \
	cp eapi.conf ~/.eapi.conf

check:
	source ws1/bin/activate; \
	python --version; \
	ansible --version

test:
	source ws1/bin/activate; \
	python p1.py



