# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(/usr/bin/dircolors -b ~/.dircolors)" || eval "$(/usr/bin/dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# ls
LS_OPTS="--color=yes"
alias ll='ls ${LS_OPTS} -alF'
alias la='ls ${LS_OPTS} -A'
alias l='ls ${LS_OPTS} -CF'
alias ls='ls ${LS_OPTS} -G'
alias ll='ls ${LS_OPTS} -al'
# job control
alias j=jobs
# editors
#alias vi=vim
#alias emacs='emacsclient -t'
