include git_prompt

COLOUR_RESET="\[\033[00m\]"
COLOUR_RED="\[\033[00;31m\]"
COLOUR_GREEN="\[\033[00;32m\]"
COLOUR_YELLOW="\[\033[00;33m\]"
COLOUR_MAGENTA="\[\033[00;35m\]"
COLOUR_CYAN="\[\033[00;36m\]"
COLOUR_WHITE="\[\033[00;37m\]"
COLOUR_ORANGE="\[\033[00;91m\]"

function __git_ps1_mod {
    if [ ! -z $(__gitdir) ] && [ $(__gitdir) != "" ]; then
        $(git diff-index --quiet --ignore-submodules HEAD 2>&1 >/dev/null)
        if  [ $? -gt 0 ]; then
            echo '^'
        fi
    fi
}

PS1="${COLOUR_ORANGE}\u@\h${COLOUR_RESET}:\W:"
PS1+="${COLOUR_YELLOW}"
PS1+='$(__git_ps1_mod)'
PS1+='$(__git_ps1 "%s")'
PS1+="${COLOUR_RESET}"
PS1+='\$ '
