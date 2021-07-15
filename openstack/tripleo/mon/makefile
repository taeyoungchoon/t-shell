all: env nagios plugins syntax start

env:
	sh firewall.sh
	sh pre.sh

nagios:
	sh nagios.sh

plugins:
	sh plugins.sh

syntax:
	sh syntax.sh

start:
	sh start.sh

config:
	sh config.sh
