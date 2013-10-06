#!/usr/bin/env bash

PACKAGES=(
    autofs
    clang
    colordiff
    emacs
    irssi
    mosh
    nmap
    tmux
    vim-enhanced
)
# phony packages do not provide an executable with the same name
PHONY=( autofs vim-enhanced )

declare -A VERSIONS
VERSIONS[emacs]=24.*
VERSIONS[bash]=4.*
VERSIONS[vim]=7.*

CWD=$(pwd)
[[ -z $HOM ]] && HOM=/home/$(logname)/
declare -A LINKS
LINKS[.bashrc]=bash_profile
LINKS[.bash_profile]=bash_profile
LINKS[.tmux.conf]=tmux.conf
LINKS[.emacs.d]=emacs.d
LINKS[.vim]=vim
LINKS[.gitconfig]=gitconfig
LINKS[.irssi]=irssi

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

init()
{
    local hostname=$(hostname)
    [[ ! $(git branch|grep \*) =~ ${hostname} ]] && (
	git checkout -b ${hostname} > /dev/null 2>&1
    )
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


verify_installed_versions()
{
    for ver in ${!VERSIONS[@]}; do
	[[ ! $($ver --version|head -n 1) =~ ${VERSIONS[$ver]} ]] && (
	    warn "Unexpected version of $ver (wanted ${VERSIONS[$ver]})."
	)
    done
}

create_links()
{
    for link in ${!LINKS[@]}; do
	[[ ! -e ${HOM}$link ]] && ln -s $CWD/${LINKS[$link]} ${HOM}$link
    done
}

[[ "$(uname)" == "Linux" ]] && exit_if_not_root
init
install_if_missing ${PACKAGES[@]}
verify_installed_versions
create_links
