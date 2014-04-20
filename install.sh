#!/usr/bin/env bash

CWD=$(pwd)
WHO=$(logname)

init()
{
    local hostname=$(hostname)
    [[ ! $(git branch|grep \*) =~ ${hostname} ]] && (
	git checkout -b ${hostname} > /dev/null 2>&1
    )
}

create_links()
{
    for link in _*; do
	[[ ! -e ${HOME}/$link ]] && ln -s $PWD/$link $HOME/${link/_/.}
    done
}


init
create_links
