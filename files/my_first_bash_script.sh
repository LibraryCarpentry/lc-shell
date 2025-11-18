#!/bin/bash
# This script loops through .txt files, returns the
# file name, first line, and last line of the file

for file in *.txt
do
 echo "$file"
 head -n 1 "$file"
 tail -n 1 "$file"
done
