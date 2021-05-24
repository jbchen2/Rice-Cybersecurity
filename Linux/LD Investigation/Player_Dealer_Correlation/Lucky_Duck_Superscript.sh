#!/bin/bash
# Author:Jackson Chen
# THIS SCRIPT WAS NOT NECESSARY FOR THE HW IT WAS JUST SOMETHING I CREATED FOR FUN AND TO SEE IF I COULD AUTOMATE THE HW WITH ONE SCRIPT

# to run script use command ./HW3_Superscript.sh
# the script will then display a report of the dates and times when losses occured as well as the player and dealer present during those losses
# the script will then ask you if you want to search for a dealer enter Y for yes and N for no
# If you entered Y please enter the 4 digit date, time am or pm, and game with a space between each.
# For the game please enter blackjack for blackjack, roulette for roulette, and holdem  for texas holdem.
# input for the game is not case sensitive
# sample input:
# 0310 12:00 am holdem
# after the search it will ask you if you would like to search for another dealer again hit Y for yes and N for no. You can repeat this process as much as you like

# unfortunately when I completed this script I was short on time and I was unable to do extensive testing so there may be a some bugs.
# also I was unable to comment my code as much as I would've liked......sorry
# Have Fun!
 
# Move data files over
cp ../../../Roulette_Player_WinLoss_0310/0310_win_loss_player_data ../../../Roulette_Player_WinLoss_0310/0312_win_loss_player_data ../../../Roulette_Player_WinLoss_0310/0315_win_loss_player_data ./
# Create file for dates and times when losses occured
grep - 031*_win_loss_player_data | awk '{sub(/_/," ")}1' | awk '{sub(/:/," ")}1' | awk '{$2="";print}' > Roulette_Losses
# Find player most present for losses
cat Roulette_Losses | awk '{$1=$2=$3=$4="";print}' | sed s/,/\\n/g | sed 's/^[ \t]*//' | sort | uniq -c | sort -nr | head -1 | awk '{$1 ="";print}' | sed 's/^[ ]//' > susplayername
cat Roulette_Losses | awk '{$1=$2=$3=$4="";print}' | sed s/,/\\n/g | sed 's/^[ \t]*//' | sort | uniq -c | sort -nr | head -1 | awk '{print $1}' | sed 's/^[ ]//' > susplayerct
#cat susplayername


#test=`cat susplayername`
echo Name of player who made the most appearances during losses: `cat susplayername` > susplayer
echo Number of appearances by player during losses: `cat susplayerct` >> susplayer
echo Dates and times of when player was present: >> susplayer
grep -i "`cat susplayername`" Roulette_Losses | awk -F- '{print $1}' >> susplayer
#cat susplayer

grep -i "`cat susplayername`" Roulette_Losses | awk -F- '{print $1}' > lossdatetime
#cat lossdatetime

#create dealer_schedule
cp ../../../Dealer_Schedules_0310/0310_Dealer_schedule ../../../Dealer_Schedules_0310/0312_Dealer_schedule ../../../Dealer_Schedules_0310/0315_Dealer_schedule ./
grep -i 00 031*_Dealer_schedule | awk '{sub(/_/," ")}1' | awk '{sub(/:/," ")}1' | awk '{$2="";print}' > dealer_schedule
#cat dealer_schedule
#create roulette_schedule
grep -i 00 031*_Dealer_schedule | awk '{print $1,$2,$5,$6}' | awk '{sub(/_/," ")}1' | awk '{sub(/:/," ")}1' | awk '{$2="";print}' > Roulette_Schedule

#Search Roulette dealer during losses

losscount=`cat lossdatetime | wc -l`
#echo $count
counter=1
while [ $counter -le $losscount ]
do
	sed -n "$counter p" lossdatetime | awk '{print $1}' > lossdate
	sed -n "$counter p" lossdatetime | awk '{print $2}' > losstime
	sed -n "$counter p" lossdatetime | awk '{print $3}' > lossampm
	#the sed s/ /?/ is just there so I can make the columns even
	cat Roulette_Schedule | grep `cat lossdate` | grep `cat losstime` | grep -i " `cat lossampm` " | awk '{print $4,$5}' | sed 's/ /?/' > lossdealer
	cat susplayername | sed 's/ /?/' > temp1
	#the temp2 and temp3 files were created to get the stupid labels to line up properly
	echo `cat lossdate` `cat losstime` `cat lossampm` `cat temp1` `cat lossdealer` >> temp2
	# column -t | sed 's/?/ /g' >> lossanalysis	
	#echo $counter
	let "counter++"
done
echo Date Time AM/PM Player Dealer > temp3
cat temp2 temp3 | column -t | sed 's/?/ /g'> lossanalysis
#cat lossdealer
#cat lossdate
#cat losstime
#cat lossampm
cat lossanalysis
 

echo Would you like to perform a dealer search?"(Y/N)":
read yn1
ans=${yn1^}
while [ $ans == "Y" ]
do
	if [[ $ans = "Y" ]]
	then
		echo Please enter the following seperated by a space "<Date> <Time> <AM/PM> <Game>":
		read dealersearch
		echo $dealersearch | awk '{print $1}' > date
		echo $dealersearch | awk '{print $2}' > stime
                echo $dealersearch | awk '{print $3}' > ampm
                echo $dealersearch | awk '{print $4}' > game
		gamesearch=`cat game | tr ['a-z]' ['A-Z']`
		if [[ $gamesearch = "BLACKJACK" ]]
                then
                        cat dealer_schedule | grep `cat date` | grep `cat stime` | grep -i " `cat ampm` " | awk '{print $1,$2,$3,$4,$5}'
                elif [[ $gamesearch = "ROULETTE" ]]
		then
                        cat dealer_schedule | grep `cat date` | grep `cat stime` | grep -i " `cat ampm` " | awk '{print $1,$2,$3,$6,$7}'
		elif [[ $gamesearch = "HOLDEM" ]]
		then
                        cat dealer_schedule | grep `cat date` | grep `cat stime` | grep -i " `cat ampm` " | awk '{print $1,$2,$3,$8,$9}'
		else
			echo Invalid Input Please Try Again
                fi
		rm date
		rm stime
		rm ampm
		rm game
		echo Would you like to perform another dealer search?"(Y/N)":
		read yn2
		ans=${yn2^}
    		if [[ $ans = "Y" ]]
    		then
			:
    		else
			ans="N"
    		fi
	fi
done

# Remove files that are no longer needed to reduce clutter
#rm 031*_win_loss_player_data
#rm 031*_Dealer_schedule
rm susplayername
rm susplayerct
rm susplayer
rm lossdatetime
rm lossdate
rm losstime
rm lossampm
rm lossdealer
rm lossanalysis
rm temp1
rm temp2
rm temp3
