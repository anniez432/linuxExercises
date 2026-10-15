#!/bin/bash

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "usage: mean.sh <column> [file.csv]" 1>&2
    exit 1
fi

column="$1"

if [[ $# -eq 2 ]]; then
    file="$2"
else
    file="/dev/stdin"
fi

if ! [[ "$column" =~ ^[1-9][0-9]*$ ]]; then
    echo "usage: mean.sh <column> [file.csv]" 1>&2
    exit 1
fi

cut -d ',' -f "$column" "$file" | tail -n +2 | {
    sum=0
    count=0
    while read -r x; do
        if [[ -n "$x" ]]; then
            sum=$(echo "$sum + $x" | bc -l)
            (( count++ ))
        fi
    done

    if [[ $count -gt 0 ]]; then
        echo "scale=2; $sum / $count" | bc -l
    fi

