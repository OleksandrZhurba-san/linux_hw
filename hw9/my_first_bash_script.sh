#!/bin/sh

export USER=ozhurba
date
echo "hello $USER"
pwd
ps aux | grep -i bioset | grep -v grep | wc -l
ls -lh /etc/passwd | awk '{print $1}'
