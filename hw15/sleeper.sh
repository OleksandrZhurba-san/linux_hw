#!/bin/sh

date=$(date "+%H:%M:%S")
process_count=$(ps aux|wc -l)
for i in {1..10}
do
	echo "$(date "+%H:%M:%S") "; echo $(ps aux|wc -l)
	sleep $1
done
cat /proc/cpuinfo >> info
cat /etc/os-release | grep ^NAME= | awk -F'=' '{print $2}'
for i in {50..100}
do
	touch "${i}.txt"
done
echo "Script has been finished"
