#!/bin/sh

echo $1
while true; do
    printf "status" | socat - TCP4:localhost:6600
done
