# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# SHOPTS
## check the window size after each command, set LINES and COLUMNS.
shopt -s checkwinsize
## correct misspellings on cd
shopt -s cdspell
## automatically cd, eg on /etc<cr>
#shopt -s autocd

# disable xon/xoff to enable i-search
stty -ixon

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export TERM=xterm-256color

# Programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
