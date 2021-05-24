#!/bin/bash
#Author:Jackson Chen
#this script finds the player that was present the most during losses as well as the number of times the player was present during losses
cat Roulette_Losses | awk '{$1=$2=$3=$4="";print}' | sed s/,/\\n/g | sed 's/^[ \t]*//' | sort | uniq -c | sort -nr | head -1
