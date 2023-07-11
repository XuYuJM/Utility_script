#!/bin/bash
# Filename: 04-monitoring.sh v0.0.1
# auto Monitor log file scripts
# by autors XuYuJM 2023

## Define default variable
d_email=3415804763@qq.com
d_log_file=/usr/local/nginx/logs/access.log

## Designated mailbox
read -p "Please enter the recipient's email address: " email
if [ -z $email ]; then
    email=$d_email
fi
## Mailbox server detection
domain=`echo "$email" | awk -F "@" '{print $2}'`
ping -c 1 -w2 "smtp.$domain" > /dev/null 2>&1
## Log file detection is valid
if [ $? -eq 0 ]; then
    read -p "Please enter the log file: " log_file
    if [ -z $log_file ]; then
        log_file=$d_log_file
    fi
    if [ -f "$log_file" ]; then
        ## Log monitoring
        tail -n 0 -f "$log_file" | while read LINE; do
            if [[ "$LINE" =~ '404' ]]; then
                echo $LINE | mail -s "The log file is abnormal. Procedure" $email > /dev/null 2>&1
            fi
        done
    else
	echo -e "\033[31m
        This is not a valid log file.
        \033[0m"
    fi
else
    echo -e "\033[31m
    This is not a valid email address.
    \033[0m"
fi
