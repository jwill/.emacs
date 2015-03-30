#!/bin/sh
# Journal v. 2.0 by John W. Allie. email: himself at johnwallie.com
# Journal is a short shell script which makes it easy to keep a daily journal. When run, the script opens the text file for the current month,
# or creates a new file if none exists. The script also writes in the date and time for you. If the script is run in the morning, it will
# instead create an entry for yesterday, in case you forgot or are writing after midnight.

JOURNALAPP=atom #change this value to your preferred text editor

cd ~/Journal #go to your journal directory, adjust value as needed

if [ `date +%p` = "AM" ] #is it AM?
    then #get yesterday's information
        DATENAME=`date -v -1d "+%Y-%m-%d.txt"` #get name of journal file
        TIMESTAMP=`date -v -1d "+%a %d" & date "+- (%l:%M %p %m/%d)"` #get timestamp for journal
    else #get today's information
        DATENAME=`date "+%Y-%m-%d.txt"` #get name of journal file
        TIMESTAMP=`date "+%a %d - (%l:%M %p)"` #get timestamp for journal
fi


if [ -f "$DATENAME" ] #check if file exists
    then #if file exists
        echo "\n"$TIMESTAMP>>$DATENAME #apply datestamp after new line
        `$JOURNALAPP $DATENAME` #open file in leafpad

    else #if file does not exist
        touch ./"$DATENAME" #create file
        echo $TIMESTAMP>>$DATENAME #apply datestamp without new line
        `$JOURNALAPP $DATENAME`
fi
