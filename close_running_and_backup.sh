#!/bin/bash

BACKUP_SOURCE="/var/lib/jupyter-notebooks/"
BUCKUP_DIR="/home/eran/Desktop/BU/"

LIST="$(docker ps -a -q --filter name=jupyter- --format="{{.Names}}")" 
echo "$LIST" | while read -r j
do
    if [ !  -z "$j" ]
    then
        docker stop "$j"
        docker rm "$j"
        echo "stopped and deleted $j container"
    fi
done

# clear old backup (older than 7 days)

## CHECK IF WORKING!

for filename in $(ls -A $BUCKUP_DIR); do
    delete=true
    for ((i=1; i<=7; i++)); do
        dir="jupyter_notebooks_backup_$(date --date="$i days ago" +%Y-%m-%d)"
        if [ "$filename" = "$dir" ] ; then
            delete=false
        fi
    done
    if [ $delete = true ] ; then
        echo "deleting $BUCKUP_DIR$filename"
        rm -rf "$BUCKUP_DIR$filename"
    fi
done

# for i in $(seq 1 4); do echo $i; done

dir="$(echo $BUCKUP_DIR)jupyter_notebooks_backup_$(date +%Y-%m-%d)"

cp -a "$BACKUP_SOURCE" "$dir"

