if [ `uname` = "Linux" ]
then
    LS_COLOR_DIRCOLOR=dircolors
else
    LS_COLOR_DIRCOLOR=gdircolors
fi
which $LS_COLOR_DIRCOLOR 2>&1 > /dev/null
if [ $? = 0 ]; then
    test -r ~/.dircolors && eval "$($LS_COLOR_DIRCOLOR -b ~/.dircolors)" || eval "$($LS_COLOR_DIRCOLOR -b)"
    alias ls='ls -F --color=auto'
    alias la='ls -A'
    alias ll='ls -lF'
    alias lla='ls -AlF'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -GF'
    alias la='ls -A'
    alias ll='ls -lF'
    alias lla='ls -AlF'
fi

# job control
alias j=jobs
# editors
#alias vi=vim
#alias emacs='emacsclient -t'
