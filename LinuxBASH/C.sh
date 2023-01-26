#!/bin/bash

# C. Create a data backup script that takes the following data as 
#parameters:
#1. Path to the syncing directory.
#2. The path to the directory where the copies of the files will be 
#stored.
#In case of adding new or deleting old files, the script must add a 
#corresponding entry to the log file 
#indicating the time, type of operation and file name. [The command to 
#run the script must be added to 
#crontab with a run frequency of one minute]

if [[ $# -eq 2 ]]
then
    src=$1
    dest=$2
    rsync -avz --progress --delete $src $dest 
--log-file=/tmp/backup.log
    echo -e "\n"
    echo "Logs writes to /tmp/backup.log"
else
    echo "This script needs 2 arguments: source dir and destination 
dir."
fi

#crontab: * * * * * /path/to/this-script
