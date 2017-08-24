# qnap-rclone

## Quick and dirty


**NOTE: Only supports Backblaze B2 type target at this time.**

To get up and running set the following environment variables:
- RCLONE_CONFIG_MYBACKUP_TYPE=b2
- RCLONE_CONFIG_MYBACKUP_ACCOUNT=&lt;b2 account number&gt;
- RCLONE_CONFIG_MYBACKUP_KEY=&lt;b2 API key&gt;

You can also specify any other supported environment variable that rclone supports (ie RCLONE_EXCLUDE_FROM=<path to files/patterns to not upload>).
