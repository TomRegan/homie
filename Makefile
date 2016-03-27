files := $(wildcard etc/*)

all: targets

.PHONY: build
build:      # Create links in the user's home directory
	$(foreach file,$(files),$(shell ln -s $(abspath $(file)) ~/.$(notdir $(file))))

.PHONY: clean
clean:      # Remove links from the user's home directory
	$(foreach file,$(files),$(shell unlink ~/.$(notdir $(file))))

targets:    # Displays this help
	@echo Targets:
	@egrep '^[a-z]+:.*#.*' Makefile | sed 's/\(.*\):\(.*\)# \(.*\)/  \1\2\3/'
