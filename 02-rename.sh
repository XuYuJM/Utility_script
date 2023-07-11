#!/bin/bash
# Filename: 02-rename.sh v0.0.1
# auto Batch rename files
# by autors XuYuJM 2023

## Define variable
dir=$1
suffix=$2

## Detection parameter value
if [ -z $dir ]; then
    echo -e "\033[31m
    The directory parameter is empty.
    \033[0m"
else
    if [ -z $suffix ]; then
        echo -e "\033[31m
        The file suffix parameter is empty.
        \033[0m"
    else
        ## Existence or not
        if [ -d $dir ]; then
            cd $dir && ls -l *.$suffix > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                ## Rename file
                i=1
                for file in *.$suffix; do
                    mv "$file" "$(printf '%03d' $i).$suffix"
                    let i=i+1
                done
                echo -e "\033[32m
                The file whose suffix is $suffix in the $dir directory is renamed.
                \033[0m"
            else
                echo -e "\033[31m
                There is no file with this suffix.
                \033[0m"
            fi
        else
            echo -e "\033[31m
            $dir is not a valid directory.
            \033[0m"
        fi
    fi
fi
