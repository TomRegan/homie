.PHONY: bash
bash:
	$(shell [ ! -h ~/.bash_profile ] && ln -s $(PWD)/bash_profile ~/.bash_profile)

.PHONY: gitconfig
gitconfig:
	$(shell [ ! -h ~/.gitconfig ] && ln -s $(PWD)/gitconfig ~/.gitconfig)

.PHONY: emacs
emacs:
	$(shell [ ! -h ~/.emacs.d ] && ln -s $(PWD)/emacs.d/ ~/.emacs.d)

.PHONY: irssi
irssi:
	$(shell [ ! -h ~/.irssi ] && ln -s $(PWD)/irssi/ ~/.irssi)

.PHONY: vim
vim:
	$(shell [ ! -h ~/.vimrc ] && ln -s $(PWD)/vimrc ~/.vimrc)
