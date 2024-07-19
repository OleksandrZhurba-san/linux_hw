#!/bin/bash

source_dir=$(pwd)/source
target_dir=$(pwd)/target

for file in "${source_dir}"/*
do
    filename=$(basename ${file})
    if [ $((filename % 2)) -eq 0 ]; then
        mv "$file" "$target_dir"
    else
        echo "$(basename ${file}) odd"
    fi
done

echo "Files has been moved"
