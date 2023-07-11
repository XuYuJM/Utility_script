#!/bin/bash
# Filename: 03-backup.sh v0.0.1
# auto Data backup script
# by autors XuYuJM 2023

## Define variable
d_path=/usr/local/nginx
d_target=html
d_backup_dir=/mnt/backup
read -p "Enter the path of the data to be backed up: " -t 30 path
if [ -z $path ]; then
    path=$d_path
fi
if [ -d $path ]; then
    read -p "Enter the file or directory that you want to back up: " -t 30 target
    if [ -z $target ]; then
        target=$d_target
    fi
    if [ -e $path/$target ]; then
        read -p "The backup file or directory is not empty: " -t 30 backup_dir
        if [ -z $backup_dir ]; then
            backup_dir=$d_backup_dir
        fi
        mkdir $backup_dir > /dev/null 2>&1
        filename=$(date +%F_%H-%M-%S)_"$target".tar.gz
        ## File backup
        echo -e "\033[32m
        Backing up $path/$target to $filename.
        \033[0m"
        tar -czf "$backup_dir"/"$filename" -C "$path" "$target" 2>> "$backup_dir"/error.log
        if [ $? -eq 0 ]; then
            echo -e "\033[32m
            Backup complete！
            \033[0m"
        else
            echo -e "\033[31m
            Backup failure please check!
            \033[0m"
        fi
    else
        echo -e "\033[31m
        The file or directory you want to back up is invalid.
        \033[0m"
    fi
else
    echo -e "\033[31m
    The path for backing up data is invalid.
    \033[0m"
fi
