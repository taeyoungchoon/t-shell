all: howto

help:
	@cat makefile | grep ^[a-z]

howto:
	@echo -------------------------------------------
	@echo add target host\(s\) to \'target.lst\' file
	@echo then type \'make ping\'
	@echo -------------------------------------------
config:
	@nmap -n -sn -oG - 192.168.25.0/24 | grep ^Host | awk '{ print $$2 }' > target.lst 

ping:
	@nmap -n -sn -oG - -iL target.lst | grep ^Host | sed 's/()/  /'

watch:
	@watch -d "nmap -n -sn -oG - -iL target.lst | grep ^Host | sed 's/()/  /'"

install_watch_on_macosx:
	@brew install watch

install_watch_on_redhat_type_linux_using_yum:
	@yum install watch

install_watch_on_redhat_type_linux_using_dnf:
	@dnf install watch

install_watch_on_debian_type_linux:
	@brew install watch

install_watch_on_windows:
	@sudo choco install watch
