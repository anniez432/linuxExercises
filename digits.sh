#!/bin/bash
pattern="^[01]+$"
sum=0
for i in {1000..2000}; do
    if [[ $i =~ $pattern ]]; then
	sum=$((sum+$i))
    fi
done
echo $sum
