#!/bin/bash
#Author:Jackson Chen
#this old script needed 3 arguments so a new one was created that only needed 2 arguments to fit in accordance to the specs
#sh altroulette_dealer_finder_by_time.sh <Date> <Time> <am/pm>
#sample input: sh altroulette_dealer_finder_by_time.sh 0310 12:00 am
#Script can handle case insensitive input of am/pm as well as a.m./p.m.

grep -i $1 Roulette_Schedule | grep -i $2 | grep -i " $3 "
cat Roulette_Schedule | sed 's/AM/A.M./' | sed 's/PM/P.M./' | grep -i $1 | grep -i $2 | grep -i "$3 "
