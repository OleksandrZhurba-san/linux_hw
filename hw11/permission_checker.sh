#!/bin/bash

directory_content=$(ls -p /opt/150424-wdm | grep -v /)

for content in $directory_content
do 
	if [[ "$content" == *.sh ]]; then
		echo $content
		chmod +x "/opt/150424-wdm/$content"
	fi
done

echo "Permission successfully has been set"
