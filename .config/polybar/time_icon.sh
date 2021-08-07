#!/usr/bin/env bash

function output() {
    currHour=$(date +"%H")
    if [ $currHour -ge 8 ] && [ $currHour -lt 19 ]
    then
        echo "%{F#E78587}"
    else
        echo "%{F#AFEEEE}"
    fi
} 

output
