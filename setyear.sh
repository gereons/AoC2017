#!/bin/sh

# perl -i -pe s/2017/$1/g $(grep -rl YEAR) 
for d in $(seq 1 25); do
    ./input.sh $d
done
