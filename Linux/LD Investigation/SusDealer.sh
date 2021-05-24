#!/bin/bash
#Author:Jackson Chen
#Script will find the dealer working during losses the most as well as the number of times he/she was working during losses.

cat Dealers_working_during_losses | awk '{print $4,$5}' | sort | uniq -c | sort -nr | head -1 | awk '{print $2,$3}'
cat Dealers_working_during_losses | awk '{print $4,$5}' | sort | uniq -c | sort -nr | head -1 | awk '{print $1}'

