all: help

.PHONY: help
help:
	@cat makefile | egrep "^[a-z]+:" | grep -v all | grep -v help | grep -v search | sed 's/://' | sed 's/^/make /'
	@echo make search lynx
	@echo make install qdir

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

# If the first argument is "search"...
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
	@echo $(RUN_ARGS)
	@choco search $(RUN_ARGS)

# If the first argument is "install"...
ifeq (install, $(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "install"
  RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY: install
install: 
	@echo help: make install qdir 
	@echo "---"
	@echo $(RUN_ARGS)
	@choco install $(RUN_ARGS)
