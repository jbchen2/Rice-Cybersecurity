#!/bin/bash
#Author:Jackson Chen
#This script creates dealer_schedule which is used in my scripts for the bonus
grep -i 00 031*_Dealer_schedule | awk '{sub(/_/," ")}1' | awk '{sub(/:/," ")}1' | awk '{$2="";print}' > dealer_schedule

