# qnap-rclone

Container to simplify syncing down content from Google drive, then syncing data out to a Backblaze B2 target.

## Quick and dirty

**NOTE: Will create a bucket named 'backup-target' and sync to that bucket.**

To get up and running set the following environment variables:
- RCLONE_CONFIG_BACKBLAZE_TYPE=b2
- RCLONE_CONFIG_BACKBLAZE_ACCOUNT=&lt;b2 application key ID&gt;
- RCLONE_CONFIG_BACKBLAZE_KEY=&lt;b2 API key&gt;

Mount in the source of the data you want backed up to Backblaze at `/backblaze-source`.

You can also specify any other supported environment variable that rclone supports (ie RCLONE_EXCLUDE_FROM=<path to files/patterns to not upload>).

To get Google drive syncing set:
- RCLONE_CONFIG_GDRIVE_TYPE=drive
- RCLONE_CONFIG_GDRIVE_TOKEN=&lt;Google drive API token&gt;
- RCLONE_CONFIG_GDRIVE_SCOPE=drive.readonly

Mount the volume where you want the contents of the Google drive synced down to at `/gdrive-backup`.

You can also set `RCLONE_CONFIG_GDRIVE_ROOT_FOLDER_ID` to get rclone to view the provided folder ID as the root of the Google drive storage.
