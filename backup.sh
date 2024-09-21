#!/bin/bash

src=$1
tgt=$2
current_timestampe=$(date "+%Y-%m-%d-%H-%M-%S")
backup_file=$tgt/backup_$current_timestampe.tgz

function taking_backup {
    tar -czf ${backup_file} --absolute-name ${src}

    if [ $? -eq 0 ]; then
        echo "backup of $src successfull at $current_timestampe"
    else
        echo "Unable to take backup at $current_timestampe"
    fi
}

taking_backup

backup_count=$(ls ${tgt} | grep -c ^backup_)

function performing_rotation {
    if [ $backup_count -gt 5 ]; then
       older_backup=$(ls -t ${tgt} | grep backup_ | tail -n 1 )
       rm -f $tgt/$older_backup
       echo "Removing older backup"

    fi
}

performing_rotation