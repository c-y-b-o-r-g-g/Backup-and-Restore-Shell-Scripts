#!/bin/bash

if [ $# -eq 4 ]
then
DIR=$1
BACKUPDIR=$2
INTERVAL=$3
MAXBACKUPS=$4
LASTINFO="directory-info.last"
NEWINFO="directory-info.new"
else
echo "Enter 4 parameters !!!"
exit 1
fi

backup_directory(){
currdate=$(date +"%Y-%m-%d-%H-%M-%S")
mkdir -p "$BACKUPDIR"
ls -lR "$DIR" > "$LASTINFO"
mkdir "$BACKUPDIR/$currdate"
cp -r "$DIR/"* "$BACKUPDIR/$currdate"
}

cleanup(){
backups=($(ls -dt "$BACKUPDIR"/*))
numbackups=${#backups[@]}

if [ "$numbackups" -gt "$MAXBACKUPS" ]
then
backupstoremove=$((numbackups - MAXBACKUPS))

for (( i=1; i<=$backupstoremove; i++ ))
do
echo "Removing Old Backup: ${backups[-$i]}"
rm -rf "${backups[-$i]}"
done
fi
}

backup_directory
while true; do
#backup_directory

ls -lR "$DIR" > "$LASTINFO"
sleep "$INTERVAL"
ls -lR "$DIR" > "$NEWINFO"

if ! diff "$NEWINFO" "$LASTINFO" > /dev/null
then
echo "Changes Detected ! , Backing Up"
backup_directory
cleanup
cp "$NEWINFO" "$LASTINFO"
else
echo "No Changes Detected !"
fi

done
