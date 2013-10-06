#!/usr/bin/env bash

PACKAGES=(
    clang
    colordiff
    emacs
    mosh
    nmap
    tmux
    vim-enhanced
)
# phony packages do not provide an executable with the same name
PHONY=( vim-enhanced )

warn()
{
    tput setaf 1  # red
    echo $@
    tput sgr0  # reset
}

exit_if_not_root()
{
    [[ $UID -ne 0 ]] && (
	warn Must be run as root to install packages.
    )  && exit
}

install_if_missing()
{
    local packages=$@
    for pkg in ${packages[@]}; do
	[[ ${PHONY[@]/$pkg/} != ${PHONY[@]} ]] && continue
	which $pkg > /dev/null 2>&1; [[ $? -ne 1 ]] && continue
	yum install -y ${packages[@]}
	break
    done;
}

[[ "$(uname)" == "Linux" ]] && exit_if_not_root
install_if_missing ${PACKAGES[@]}

CWD=$(pwd)
[[ -z $HOM ]] && HOM=/home/$(logname)/
declare -A LINKS
LINKS[.bashrc]=bash_profile
LINKS[.tmux.conf]=tmux.conf
LINKS[.emacs.d]=emacs.d
LINKS[.vim]=vim

for link in ${!LINKS[@]}; do
    [[ ! -e ${HOM}$link ]] && ln -s $CWD/${LINKS[$link]} ${HOM}$link
done

#[[ ! -h ~/.bashrc ]] && ln -s $CWD/bash_profile ~/.bashrc
#[[ ! -h ~/.tmux.conf ]] && ln -s $CWD/tmux.conf ~/.tmux.conf
#[[ ! -h ~/.emacs.d ]] && ln -s $CWD/emacs.d ~/.emacs.d
#[[ ! -h ~/.vim ]] && ln -s $CWD/vim ~/.vim
