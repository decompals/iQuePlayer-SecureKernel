#!/bin/bash

shopt -s globstar

ls asm/non_matchings/**/*.s > old_list.txt
grep INCLUDE_ASM -r src | sed -E --expression='s/.+INCLUDE_ASM\(\"(.+)\", (.+)\);(.+)?/\1\/\2.s/g' > cur_list.txt

comm -3 <(sort old_list.txt) <(sort cur_list.txt) > diff.txt

rm old_list.txt cur_list.txt

if [ "$1" = "-d" ]
then
    if [ -s diff.txt ]
    then
        rm $(cat diff.txt)
    fi
    rm diff.txt
else
    if [ -s diff.txt ]
    then
        cat diff.txt
        rm diff.txt
        exit 55
    else
        rm diff.txt
    fi
fi
