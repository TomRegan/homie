eval export PATH="/Users/tom/.sbtenv/shims:${PATH}"
export SBTENV_SHELL=bash
source '/usr/local/Cellar/sbtenv/0.0.9/libexec/../completions/sbtenv.bash'
sbtenv rehash 2> /dev/null
unset -f sbtenv
sbtenv() {
    local command
    command="$1"
    if [ "$#" -gt 0 ]; then
        shift
    fi

    case "$command" in
        rehash|shell)
            eval "`sbtenv "sh-$command" "$@"`";;
        * )
            command sbtenv "$command" "$@";;
    esac
}
