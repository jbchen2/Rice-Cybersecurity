#!/bin/bash
#Author:Jackson Chen
#New script that only needs 2 arguments in accordance to the specs
#sh roulette_dealer_finder_by_time.sh <Date> <Time>
#sample input: sh roulette_dealer_finder_by_time.sh 0310 12:00am 
#Script can handle cases that where there is a . before and after the letter m in am or pm. (a.m./p.m.)
#Script can handle cases where the seconds are not included in the time. (ex: 12:00am instead of 12:00:00am)


cat Roulette_Schedule | sed 's/00://' | sed 's/ AM /AM /' | sed 's/ PM /PM /' | grep $1 | grep -i $2
cat Roulette_Schedule | sed 's/00://' | sed 's/ AM /A.M. /' | sed 's/ PM /P.M. /' | grep $1 | grep -i $2
cat Roulette_Schedule | sed 's/ AM /AM /' | sed 's/ PM /PM /' | grep $1 | grep -i $2
cat Roulette_Schedule | sed 's/ AM /A.M. /' | sed 's/ PM /P.M. /' | grep $1 | grep -i $2

