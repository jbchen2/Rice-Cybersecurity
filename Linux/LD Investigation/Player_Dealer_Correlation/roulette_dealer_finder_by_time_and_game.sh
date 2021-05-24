#!/bin/bash
#Author: Jackson Chen
#sh roulette_dealer_finder_by_time_and_game.sh <Date> <Time> <Game>
#Sample input: sh roulette_dealer_finder_by_time_and_game.sh 0310 12:00:00am BlackJack

#Script can handle cases that where there is a . before and after the letter m in am or pm. (a.m./p.m.)
#Script can handle cases where the seconds are not included in the time. (ex: 12:00am instead of 12:00:00am)
#Script allows for third argument to be case insensitive
game=`echo $3 | tr ['a-z]' ['A-Z']`

if [ $game = "BLACKJACK" ] 
then
	cat dealer_schedule | sed 's/ AM /AM /' | sed 's/ PM /PM /' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$3,$4}'
	cat dealer_schedule | sed 's/ AM /A.M. /' | sed 's/ PM /P.M. /' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$3,$4}'
	cat dealer_schedule | sed 's/ AM /AM /' | sed 's/ PM /PM /' | sed 's/:00//' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$3,$4}'
	cat dealer_schedule | sed 's/ AM /A.M. /' | sed 's/ PM /P.M. /' | sed 's/:00//' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$3,$4}'
elif [ $game = "ROULETTE" ]
then
	cat dealer_schedule | sed 's/ AM /AM /' | sed 's/ PM /PM /' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$5,$6}'
	cat dealer_schedule | sed 's/ AM /A.M. /' | sed 's/ PM /P.M. /' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$5,$6}'
        cat dealer_schedule | sed 's/ AM /AM /' | sed 's/ PM /PM /' | sed 's/:00//' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$5,$6}'
        cat dealer_schedule | sed 's/ AM /A.M. /' | sed 's/ PM /P.M. /' | sed 's/:00//' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$5,$6}'

elif [ $game = "HOLDEM" ]
then
	cat dealer_schedule | sed 's/ AM /AM /' | sed 's/ PM /PM /' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$7,$8}'
	cat dealer_schedule | sed 's/ AM /A.M. /' | sed 's/ PM /P.M. /' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$7,$8}'
        cat dealer_schedule | sed 's/ AM /AM /' | sed 's/ PM /PM /' | sed 's/:00//' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$7,$8}'
        cat dealer_schedule | sed 's/ AM /A.M. /' | sed 's/ PM /P.M. /' | sed 's/:00//' | grep -i $1 | grep -i $2 | awk '{print $1,$2,$7,$8}'

else
	echo Invalid Input Please Try Again
fi
