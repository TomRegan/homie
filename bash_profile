# File          : .bashrc
# Author        : Tom Regan <code.tom.regan@gmail.com>

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

COLOUR_RESET="\[\033[00m\]"
COLOUR_RED="\[\033[00;31m\]"
COLOUR_GREEN="\[\033[00;32m\]"
COLOUR_YELLOW="\[\033[00;33m\]"
COLOUR_MAGENTA="\[\033[00;35m\]"
COLOUR_CYAN="\[\033[00;36m\]"
COLOUR_WHITE="\[\033[00;37m\]"
COLOUR_ORANGE="\[\033[00;91m\]"

# Programmable completion features
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# source environment
CONFIG_DIR=~/Development/config
CONFIG_FILES=(
    "bash_aliases"
    "perforce_settings"
    "mac_settings"
    "ruby_settings"
    "java_settings"
    "mvn_settings"
    "git-completion"
    "git-prompt"
    "p4settings"
    "pass-settings"
    "ssh-settings"
    "perforce_prompt"
)
for file in ${CONFIG_FILES[@]}; do
    [ -f ${CONFIG_DIR}/${file} ] && source ${CONFIG_DIR}/${file}
done

# search through local (homebrew) before system binaries
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:${CONFIG_DIR}/utilities

# set the prompt
PS1="${COLOUR_GREEN}\u@\h${COLOUR_RESET}:\W:${COLOUR_YELLOW}"
PS1+='$(__git_ps1 "%s")'
PS1+="${COLOUR_RESET}\$ "

