#!/usr/bin/env bash

function include {
    local fn=$1
    [[ -f $CCD/include/$fn ]] && {
        source $CCD/include/$fn && return
    }
    [[ -f $CCD/include/$fn.sh ]] && {
        source $CCD/include/$fn.sh && return
    }
    [[ -f $CCD/include/$fn.bash ]] && {
        source $CCD/include/$fn.bash && return
    }
}
