#!/bin/bash
#Author:Jackson Chen
#This script creates Roulette_Schedule which is used in some of my other scripts
#Roulette_Schedule shows which dealers are working at which times
grep -i 00 031*_Dealer_schedule | awk '{print $1,$2,$5,$6}' | awk '{sub(/_/," ")}1' | awk '{sub(/:/," ")}1' | awk '{$2="";print}' > Roulette_Schedule
