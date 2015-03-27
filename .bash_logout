
# Clean /tmp folder with my files and folders older than 3 days.
find /tmp -mindepth 1 -maxdepth 1 -ctime +3 -user $USER -exec rm -rf {} \;

