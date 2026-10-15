#!/bin/bash                                                                     
mkdir five
for dir in five/dir{1..5}; do
    mkdir dir{1..5}

    for x in {1..4}; do
	x1=$x

	while [[ $x1 -ge 1 ]]; do
            echo $x
            x1=$((x1-1))
	done > "$dir/file$x"
    done
done
