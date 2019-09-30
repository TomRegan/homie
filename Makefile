files := $(wildcard home/*)

all: help

.PHONY: install
install: ## create links in the user's home directory
	$(foreach file,$(files),$(shell ln -s $(abspath $(file)) ~/.$(notdir $(file))))

.PHONY: clean
clean: ## remove links from the user's home directory
	$(foreach file,$(files),$(shell unlink ~/.$(notdir $(file))))

.PHONY: depends
depends: ## install dependencies
	@brew install `awk '/^[^#]/ { print $$1 }' requirements.txt`

.PHONY: help
help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {gsub("\\\\n",sprintf("\n%22c",""), $$2);printf "\033[92m%-10s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
