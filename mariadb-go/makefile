index:
	@grep ^[a-z] makefile | sed -e 's/://' -e 's/^/- /'
check:
	@systemctl status mariadb
download:
	@sh download.sh
install:
	@sh install.sh
secure:
	@sh secure.sh
backup:
	@sh backup.sh
uninstall:
	@sh uninstall.sh
clean:
	@sh uninstall.sh
	@rm -rf /dbbackup
