include color
include git_prompt

function __timecheck {
    export IPADDRESS_CHECK=`date -d "+1 min" +%s`
}

function __timestamp {
    echo `date +%s`
}

function __ip_address {
    local _ipaddress_time=`head -1 ~/.ipaddress`
    if [ -z $_ipaddress_time ]
    then
	echo `dig +short myip.opendns.com @resolver1.opendns.com`:`date -d "+1 min" +%s` > ~/.ipaddress
	local _ipaddress_time=`head -1 ~/.ipaddress`
	if [ -z $_ipaddress_time ]
	then
	    echo ""
	fi
    fi
    local _ipaddress=`cut -d: -f1 <(echo $_ipaddress_time)`
    local _time=`cut -d: -f2 <(echo $_ipaddress_time)`
    if [ $_time -gt `date +%s` ]
    then
	echo `dig +short myip.opendns.com @resolver1.opendns.com`:`date -d "+1 min" +%s` > ~/.ipaddress
	local _ipaddress_time=`head -1 ~/.ipaddress`
    fi
    local _ipaddress=`cut -d: -f1 <(echo $_ipaddress_time)`
    local _time=`cut -d: -f2 <(echo $_ipaddress_time)`
    echo $_ipaddress

}

function __git_ps1_mod {
    [[ $(__gitdir) != "" && $(git status --porcelain) != "" ]] && echo '+'
}
# PS1+="${COLOR_CYAN}"
# PS1+='$(__git_ps1 "%s")'
# PS1+='$(__git_ps1_mod)'
# PS1+="${COLOR_RESET}"

function __exitstatus {
    local _code=$1
    if [[ $_code == 0 ]]
    then
        echo ""
    else
        echo "!"
    fi
}
#PS1+="\[${COLOR_RED}\]"
#PS1+='$(__exitstatus "$?")'
#PS1+="\[${COLOR_RESET}\]"

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWCOLORHINTS=1

PS1="\[${COLOR_LIGHT_GREEN}\]\u\[${COLOR_RESET}\]@"
PS1+="\[${COLOR_LIGHT_GREEN}\]\h\[${COLOR_RESET}\] "
PS1+="\[${COLOR_PURPLE}\]\W\[${COLOR_RESET}\] "
PS1+="\[${COLOR_CYAN}\]"
PS1+="\$(__git_ps1 \"%s \")"
PS1+="\[${COLOR_RESET}\]"
PS1+='% '
