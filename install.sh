#!/usr/bin/env bash

init()
{
    [[ ! $(git branch|grep \*) =~ ${HOSTNAME} ]] && (
        git checkout -b ${HOSTNAME} > /dev/null 2>&1
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
