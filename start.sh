#!/bin/bash -x
# vim: expandtab:tabstop=4:shiftwidth=4

set -e


if [ "$RCLONE_CONFIG_MYBACKUP_TYPE" == "" ]; then
    echo "No env vars found!"
    exit 1
fi

if [ "$SLEEP_FOR" == "" ]; then
  # default sleep for 12 hours
  SLEEP_FOR=43200
fi

# Backblaze B2-type
if [ "$RCLONE_CONFIG_MYBACKUP_TYPE" == "b2" ]; then
    B2_BACKUP_NAME="backup-target"
    rclone mkdir MYBACKUP:${B2_BACKUP_NAME}
    while [ true ]; do
        rclone sync /backup-source MYBACKUP:${B2_BACKUP_NAME} || true
        sleep $SLEEP_FOR
    done
fi
