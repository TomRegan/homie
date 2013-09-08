.PHONY: emacs
emacs:
	$(shell [ ! -h ~/.emacs.d ] && ln -s $(PWD)/emacs.d/ ~/.emacs.d)

.PHONY: irssi
irssi:
	$(shell [ ! -h ~/.irssi ] && ln -s $(PWD)/irssi/ ~/.irssi)
