#!/bin/bash -x
# vim: expandtab:tabstop=4:shiftwidth=4

# Sync things up to backblaze, and sync things down from various sources

set -e

if [ "$SLEEP_FOR" == "" ]; then
  # default sleep for 12 hours
  SLEEP_FOR=43200
fi

if [ "$RCLONE_CONFIG_BACKBLAZE_TYPE" == "b2" ]; then
    # create b2 bucket
    B2_BACKUP_NAME="backup-target"
    rclone mkdir BACKBLAZE:${B2_BACKUP_NAME}
fi

while [ true ]; do
    # Sync DOWN
    # Google drive
    if [ "$RCLONE_CONFIG_GDRIVE_TYPE" == "drive" ]; then
	rclone sync gdrive: /gdrive-backup || true
    fi

    # Sync UP
    # Backblaze B2
    if [ "$RCLONE_CONFIG_BACKBLAZE_TYPE" == "b2" ]; then
        rclone sync /backblaze-source BACKBLAZE:${B2_BACKUP_NAME} || true
    fi

    sleep $SLEEP_FOR
done
