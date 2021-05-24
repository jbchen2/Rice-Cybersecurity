#!/bin/bash
#Author:Jackson Chen
#this script creates the Roulette_Losses file used for my playercount script
grep - 031*_win_loss_player_data | awk '{sub(/_/," ")}1' | awk '{sub(/:/," ")}1' | awk '{$2="";print}' > Roulette_Losses
