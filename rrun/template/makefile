HN := $(shell hostname)

all: check

check:
	uptime > uptime_of_$(HN).out

clean:
	rm *.out
