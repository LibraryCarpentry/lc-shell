#!/bin/bash

for filename in *.txt
do
 echo $filename
 head -n 5 $filename
 tail -n 5 $filename
done