all: help

help:
	@grep ^[a-z] makefile
check:
	sh check.sh
download:
	echo arista.com
import:
	sh import.sh
start:
	sh start.sh
conn1:
	docker exec -it ceos1 Cli
conn2:
	docker exec -it ceos2 Cli
stop:
	sh stop.sh
clean:
	sh clean.sh
	rm *~
