all: run

help:
	@cat makefile | grep ^[a-z]

run:
	cat in | perl f.pl

loop:
	while true; do cat in | perl f.pl; sleep 3; done

check:
	@cat in | perl f.pl > out
	@diff in out || exit 0
	@rm out
