# File          : .bashrc
# Author        : Tom Regan <code.tom.regan@gmail.com>
# Last Modified : 2012-01-07

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac


# Colour prompt settings
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='\[\033[00;35m\]\u@\h\[\033[00m\]:\[\033[01;00m\]\W:\[\033[00;33m\]$(__git_ps1 "%s")\[\033[00m\]\$ '
else
    PS1='{debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Programmable completion features

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# source environment
CONFIG_DIR=~/Development/config
[ -f ${CONFIG_DIR}/.bash_aliases ] && source ${CONFIG_DIR}/.bash_aliases
[ -f ${CONFIG_DIR}/.perforce_settings ] && source ${CONFIG_DIR}/.perforce_settings
[ -f ${CONFIG_DIR}/.mac_settings ] && source ${CONFIG_DIR}/.mac_settings
[ -f ${CONFIG_DIR}/.ruby_settings ] && source ${CONFIG_DIR}/.ruby_settings
[ -f ${CONFIG_DIR}/.java_settings ] && source ${CONFIG_DIR}/.java_settings
[ -f ${CONFIG_DIR}/.mvn_settings ] && source ${CONFIG_DIR}/.mvn_settings
[ -f ${CONFIG_DIR}/.git-completion ] && source ${CONFIG_DIR}/.git-completion
[ -f ${CONFIG_DIR}/.git-prompt ] && source ${CONFIG_DIR}/.git-prompt
[ -f ${CONFIG_DIR}/.p4settings ] && source ${CONFIG_DIR}/.p4settings
[ -f ${CONFIG_DIR}/.pass-settings ] && source ${CONFIG_DIR}/.pass-settings
[ -f ${CONFIG_DIR}/.ssh-settings ] && source ${CONFIG_DIR}/.ssh-settings

# search through local (homebrew) before system binaries
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/${CONFIG_DIR}/utilities
