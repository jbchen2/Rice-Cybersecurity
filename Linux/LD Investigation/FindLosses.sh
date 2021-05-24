#!/bin/bash
#Author:Jackson Chen
#sh FindLosses.sh <Date> <Time> <AM/PM>
#sample input: sh FindLosses.sh 0310 05:00 am
#Script used to create Dealers_working_during_losses file.
#I would look at the list of dates and times for when losses occured then plug the dates and times one by one.
#Script can handle case insensitive input for am/pm
 
grep $1 Roulette_Schedule | grep $2 | grep -i " $3 " >> Dealers_working_during_losses

# cat Dealers_working_during_losses

