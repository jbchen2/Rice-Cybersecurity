#!/bin/bash
#Author: Jackson Chen
#a more barebones script with minimal exception handleing
#sh altroulette_dealer_finder_by_time_and_game.sh <Date> <Time> <am/pm> <column for dealer first name> <column for dealer last name>
#sample input: sh altroulette_dealer_finder_by_time_and_game.sh 0310 12:00 pm 8 9 
#for the 4th and 5th arguments enter:
#4 for blackjack dealer first name and 5 for blackjack dealer last name
#6 for roulette dealer first name and 7 for roulette dealer last name
#8 for texas holdem dealer first name and 9 for texas holdem dealer last name
#Script can handle case insensitive input for am/pm

cat dealer_schedule | grep "$1" | grep "$2" | grep -i " $3 " | awk '{print $1,$2,$3,$'$4',$'$5'}'
