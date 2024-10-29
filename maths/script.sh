#!/bin/bash

if exec 3>/dev/tcp/localhost/1356; then
    while read -u 3 line; do
        echo $line | ./socket
    done;
else
	echo "server down."
fi

