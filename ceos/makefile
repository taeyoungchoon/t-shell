all: help

help:
	@grep ^[a-z] makefile
check:
	@sh check.sh
download:
	@echo 1. http://arista.com
	@echo '2. Support > Software Download'
	@echo '3. EOS > Support Only Releases > 4.2.1 > EOS-4.21.0F > cEOS-lab'
	@echo 4. download cEOS-lab.tar.xz
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
