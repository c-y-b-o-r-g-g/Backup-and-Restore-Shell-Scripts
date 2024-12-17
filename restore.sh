#!/bin/bash

if [ $# -eq 2 ]
then
DIR=$1
BACKUPDIR=$2
else
echo "Arguments Invalid!"
exit 1
fi

backups=($(ls -d "$BACKUPDIR"/* |sort))

restore(){
backuptime=$1
echo"Restoring..."
rm -rf "$DIR"/*
cp -r "$backuptime/"* "$DIR"
}

currindex=$((${#backups[@]}-1))

while true
do
echo "Choose an Option:"
echo "1.Restore the Previous Version"
echo "2.Restore to next available version"
echo "3.Exit"
read -p "Enter Choice: " choice



case $choice in
1)
if [ $currindex -gt 0 ]
then
currindex=$((currindex - 1))
restore "${backups[$currindex]}"
echo "Restored to a previous version: ${backups[$currindex]}"
else
echo "No older backup available to restore"
fi
;;
2)
if [ $currindex -lt $((${#backups[@]} - 1)) ]
then
currindex=$((currindex + 1))
restore "${backups[$currindex]}"
echo "Restored to a next Version: ${backups[$currindex]}"
else
echo "No newer backup available to restore."
fi
;;
3)
echo "Exiting.."
break
;;

*)
echo "Invalid Choice, Try again."
;;

esac
done
