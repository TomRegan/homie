#! /bin/sh

function __ssh_completions {
    if [ ! -f ~/.ssh/config ]; then
        return
    fi
    # simple matcher to read values found in the Host configuration
    local hosts=$(sed \
                      --quiet \
                      --expression='s/^\s*[Hh]ost[^a-zA-Z]\s*=\?\s*\(.*\)\s*$/\1/p' \
                      ~/.ssh/config \
                      | grep -v ^*$)
    # picks apart regular expressions found in Matches configuration
    # should fail gracefully, except where nested expansion is used,
    # in which case it will produce garbage completions
    local matches=$(sed \
                        --quiet \
                        --expression="s/^\s*match\s*=.*^\\\(\(.*\)\\\)$'.*$/\1/p" \
                        ~/.ssh/config \
                        | sed \
                              --expression='s/\[\([0-9]\)\(\-\|,\)\([0-9]\)\]/{\1..\3}/g' \
                              --expression='s/\\|/ /g' \
                              --expression='s/\(\\(\|\\)\)//g')
    local response=$(compgen -W "$hosts $matches"  -- ${COMP_WORDS[COMP_CWORD]})
    COMPREPLY=( $response )
}

complete -F __ssh_completions ssh
