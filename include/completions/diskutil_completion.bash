#!/usr/bin/env bash

function __diskutil_completion {
    local response=$(compgen -W "list info listFilesystems activity unmount unmountDisk eject mount mountDisk enableJournal disableJournal moveJournal enableOwnership disableOwnership renameVolume verifyVolume repairVolume verifyDisk repairDisk eraseDisk eraseVolume reformat eraseOptical zeroDisk randomDisk secureErase partitionDisk resizeVolume splitPartition mergePartitions appleRAID coreStorage" -- ${COMP_WORDS[COMP_CWORD]})
    COMPREPLY=( $response )
}
complete -F __diskutil_completion diskutil
