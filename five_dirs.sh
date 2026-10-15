#!/bin/bash                                                                     
mkdir five
cd five
mkdir dir{1..5}

for dir in five; do
    cd dir
    
    for x in {1..4}; do
	x1=$x

	while [[ $x1 -ge 1 ]]; do
            echo $x
            x1=$((x1-1))
	done > "file$x"
    done
done
