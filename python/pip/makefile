help:
	@cat makefile | grep ^[a-z]

all: check install check uninstall check

check:
	echo check
	python -c 'import pexpect' 

install: install-using-pip

install-using-pip:
	echo install using pip
	pip install pexpect

install-using-requirements:
	echo install using requirements
	pip install -r requirements.txt

install-locally-using-requirements:
	echo install locally using requirements
	pip install -r requirements.txt --no-index --find-links=data/

uninstall:
	echo uninstall
	pip uninstall -y pexpect
