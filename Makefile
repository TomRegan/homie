.PHONY: emacs
emacs:
	$(shell [ ! -h ~/.emacs.d ] && ln -s $(PWD)/emacs.d/ ~/.emacs.d)
