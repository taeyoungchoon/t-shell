all:
	@grep '^[a-z]' makefile | grep -v '^all'
check:
	@sh check_config.sh
	@sh check_proc.sh
fix:
	@sh backup_config.sh
	@sh fix_config.sh
	@sh reload_config.sh
clean:
	rm *~
distclean:
	rm -rf backup
