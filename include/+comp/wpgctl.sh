#! /bin/bash

function __wpg_completions {
    local result=`wpgctl | sed --quiet --expression='s/^Usage:\ wpgctl\ \([a-z\|]\+\).*$/\1/' --expression='s/|/ /gp'`
    local response=$(compgen -W "$result"  -- ${COMP_WORDS[COMP_CWORD]})
    COMPREPLY=( $response )
}
complete -F __wpg_completions wpgctl
