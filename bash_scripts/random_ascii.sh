#!/bin/bash

RANDOM_NUMBER=$((1 + $RANDOM % 3 ))

#echo $RANDOM_NUMBER

if [ $RANDOM_NUMBER == 1 ]; then 
  clear
  wget -q -O - https://raw.githubusercontent.com/stark/Color-Scripts/master/color-scripts/dna | bash
elif [ $RANDOM_NUMBER == 2 ]; then
  clear
  wget -q -O - https://raw.githubusercontent.com/stark/Color-Scripts/master/color-scripts/pinguco | bash
elif [ $RANDOM_NUMBER == 3 ]; then
  wget -q -O - https://raw.githubusercontent.com/stark/Color-Scripts/master/color-scripts/elfman | bash
else
  curl -s https://api.github.com/repos/stark/Color-Scripts/contents/color-scripts | jq -r '.[].name'
fi
