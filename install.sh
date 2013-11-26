#!/usr/bin/env bash

CWD=$(pwd)
WHO=$(logname)

if [[ $(uname) =~ Darwin ]]; then
    PACKMAN=brew
    HOMES=/Users
else
    PACKMAN=yum
    HOMES=/home
fi
[[ -z $HOM ]] && HOM=$HOMES/$WHO

warn()
{
    tput setaf 1  # red
    echo $@
    tput sgr0  # reset
}

install_bash()
{
    local shells=/etc/shells
    local bashbin=/usr/local/bin/bash
    [[ ! -f $bashbin ]] && brew install bash
    grep $bashbin $shells; [[ $? -eq 0 ]] &&  return
    [[ -f $shells  &&  -f $bashbin ]] && echo $bashbin >> $shells
    hash $bashbin bash
    echo -n "Link bash_profile to ~/.bash_profile? [Y/*]: "
    [[ $(read UIN && echo $UIN) =~ Y|y ]] && ln bash_profile ~/.bash_profile
    echo "Run this script again using $bashbin"
}

check_bash()
{
    # we want to guard against using the features below if bash version < 4
    if [[ ! $(bash --version | head -n 1) =~ 4.[0-9] ]]; then
	warn "Bash version 4 is not being used but is required."
	echo -n "Do you want to use $PACKMAN to install Bash 4? [Y/*]: "
	[[ $(read UIN && echo $UIN) =~ Y|y ]] && install_bash
	exit
    fi
    
}
#check_bash

LINUX_PACKAGES=(
    autofs
    cmake
    clang
    vin-enhanced
)

PACKAGES=(
    colordiff
    emacs
    irssi
    maven
    mosh
    nmap
    pass
    tmux
    unrar
)
# phony packages do not provide an executable with the same name so they
# won't be used to determine if we should install packages
PHONY=( autofs maven vim-enhanced )

declare -A VERSIONS
VERSIONS[emacs]=24
VERSIONS[vim]=7

declare -A LINKS
LINKS[.bashrc]=bash_profile
LINKS[.bash_profile]=bash_profile
LINKS[.tmux.conf]=tmux.conf
LINKS[.emacs.d]=emacs.d
LINKS[.vim]=vim
LINKS[.gitconfig]=gitconfig
LINKS[.irssi]=irssi

exit_if_not_root()
{
    [[ $UID -ne 0 ]] && (
	warn Must be run as root to install packages.
    ) && exit
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
	# continue if the package is in the list of phonies
	[[ ${PHONY[@]/$pkg/} != ${PHONY[@]} ]] && continue
	# continue if the package is installed
	which $pkg > /dev/null 2>&1; [[ $? -ne 1 ]] && continue
	$PACKMAN install -y ${packages[@]}
	break
    done;
}

install_libflashplayer()
{
    local uri=https://www.dropbox.com/s/8s39sojx07hhy7t/libflashplayer.so.gz
    local filename=$(basename $uri)
    local destination=$HOM/.mozilla/plugins
    local funpacked=${filename%.*}
    local curlopts="-f --create-dirs -L -o"
    [[ ! -f $destination/$funpacked ]] && (
	curl $curlopts $destination/$filename $uri && (
	    gunzip -f $destination/$filename || (
		rm $destination/$filename
		warn "Failed to unpack $filename"
	    )
	    [[ -f $destination/$funpacked ]] && chown $WHO $destination/$funpacked
	) || warn "Failed to download $filename"
    )
}

verify_installed_versions()
{
    for ver in ${!VERSIONS[@]}; do
	[[ ! $($ver --version|head -n 1) =~ ${VERSIONS[$ver]}.[0-9] ]] && (
	    warn "Unexpected version of $ver (wanted ${VERSIONS[$ver]})."
	)
    done
}

create_links()
{
    for link in ${!LINKS[@]}; do
	[[ ! -e ${HOM}/$link ]] && ln -s $CWD/${LINKS[$link]} ${HOM}/$link
    done
}


[[ "$(uname)" == "Linux" ]] && exit_if_not_root
init
install_if_missing ${PACKAGES[@]}
verify_installed_versions
create_links
#install_libflashplayer
