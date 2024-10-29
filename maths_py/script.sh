#!/bin/bash

exec 3<>/dev/tcp/127.0.0.1/1356

while read line
do
    echo $line
    if [[ "$line" == *"CHALLENGE"* ]]; then

        read -u 5 res
        echo $res >&3
    fi

done <&3