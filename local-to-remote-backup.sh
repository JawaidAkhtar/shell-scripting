#!/bin/bash

src=$1
remote_tgt=$2
current_timestampe=$(date "+%Y-%m-%d-%H-%M-%S")
local_backup_file=backup_$current_timestampe.tgz

function taking_backup {
    # Create the backup archive locally
    tar -czf ${local_backup_file} --absolute-names ${src}

    if [ $? -eq 0 ]; then
        echo "Backup of $src successful at $current_timestampe"

        # Copy the backup file to the remote server using scp
        scp -o StrictHostKeyChecking=no -i "demo-server-key.pem" ${local_backup_file} ${remote_tgt}
        if [ $? -eq 0 ]; then
            echo "Backup file successfully transferred to remote server"
        else
            echo "Failed to transfer the backup file to the remote server"
            return 1
        fi

        # Optionally, remove the local backup file after successful transfer
        rm -f ${local_backup_file}
    else
        echo "Unable to take backup at $current_timestampe"
        return 1
    fi
}

function performing_rotation {
    # SSH into the remote server to check the number of backup files
    ssh -o StrictHostKeyChecking=no -i "demo-server-key.pem" ubuntu@ec2-18-117-152-89.us-east-2.compute.amazonaws.com << EOF
    backup_count=\$(ls /home/ubuntu/backup | grep -c ^backup_)
    
    if [ \$backup_count -gt 5 ]; then
        older_backup=\$(ls -t /home/ubuntu/backup | grep backup_ | tail -n 1)
        rm -f /home/ubuntu/backup/\$older_backup
        echo "Removing older backup: \$older_backup"
    fi
EOF
}

# Execute backup function
taking_backup

if [ $? -eq 0 ]; then
    # Perform backup rotation after a successful backup
    performing_rotation
else
    echo "Backup failed, skipping rotation."
fi
