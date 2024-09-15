all: help

.PHONY: help
help:
	@cat makefile | egrep "^[a-z]+:" | grep -v all | grep -v help | grep -v search | sed 's/://' | sed 's/^/make /'
	@echo make search lynx

.PHONY: ls
ls:
	@choco list | \
	egrep -v ".install|.app|.portable|.extension|vcredist|^KB|installed" | \
	python -c "import sys; [print(line.split()[0]) for line in sys.stdin]"


.PHONY: upgrade
upgrade: upgrade-twice

.PHONY: upgrade-twice
upgrade-twice:
	make upgrade-once
	make upgrade-once

.PHONY: upgrade-once
upgrade-once:
	@choco upgrade all -y

# If the first argument is "run"...
ifeq (search, $(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "search"
  RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: search
search: 
	@echo help: make search vlc
	@echo "---"
	@choco search $(RUN_ARGS)
