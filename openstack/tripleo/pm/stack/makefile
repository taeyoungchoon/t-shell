all: install

install: pkg config undercloud

pkg:
	sh pkg.sh
config:
	sh config.sh
undercloud:
	cd ~/
	openstack undercloud install
deploy: overcloud

overcloud:
	echo 'not yet'
clean:
	rm *~
