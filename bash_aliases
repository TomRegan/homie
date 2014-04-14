# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi=vim
alias emacs="emacs -nw"
alias j=jobs
alias ls='ls -G'
alias ll='ls -al'
which colordiff > /dev/null
alias p4d="p4 diff -du | (( $? == 0 ? colordiff : cat   )) | more -R"
alias cp='rsync -P'