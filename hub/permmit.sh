#!/bin/bash

cd /mount/jupyter-notebooks

while true; do

LIST="$(ls -lA | grep root |rev |cut -f1 -d' '|rev)" 
echo "$LIST" | while read -r j
do
    if [ !  -z "$j" ]
    then
        chown -R 1000:1000 "$j"
        echo $j
    fi
done

sleep 2

done
