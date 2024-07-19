#!/bin/bash


for i in {1..100}
do
    name=$RANDOM
    touch ./source/${name}
done
