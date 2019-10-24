filedir := $(wildcard home/*)
distrib := $(shell uname -s)
profile = $(if $(filter Linux,$(distrib)),bashrc,bash_profile)

all: help

.PHONY: test
test:
	foo=bar lib/mo

.PHONY: install
install: ## create links in the user's home directory
	$(foreach file,$(filedir),$(shell ln -s $(abspath $(file)) ~/.$(notdir $(file))))
	@mv ~/.-profile ~/.$(profile)

.PHONY: clean
clean: ## remove links from the user's home directory
	$(foreach file,$(filter-out home/-profile,$(filedir)),$(shell unlink ~/.$(notdir $(file))))
	@test -f ~/.$(profile) && unlink ~/.$(profile)

.PHONY: depends
depends: ## install dependencies
	@brew install `awk '/^[^#]/ { print $$1 }' requirements.txt`

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {gsub("\\\\n",sprintf("\n%22c",""), $$2);printf "\033[92m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
