#!/bin/bash
# Filename: 01-files.sh v0.0.1
# auto Calculates the number of files in a folder
# by authors XuYuJM 2023

## Detection parameter value
dir=$1
if [ -z $dir ]; then
    echo -e "\033[31m
    Please add parameters such as {sh $0 /mnt}.
    \033[0m"
else
    ## Check directory value
    if [ -d $dir ]; then
        count=$(ls -l $dir | wc -l)
        echo -e "\033[32m
        There are $count files in $dir.
        \033[0m"
    else
        echo -e "\033[31m
        $dir is not a valid directory.
        \033[0m"
    fi
fi
