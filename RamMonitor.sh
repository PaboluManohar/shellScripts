#!/bin/bash

#	Monitor free space
#	free
#	free -h (humanredable)
#	free -mt (total in megaByte)
#	free -mt | grep "Total"
#	free -mt | grep "Total" | awk '{print $4}'  ----> $4 means 4th column in 'Total' row

free_space=$(free -mt | grep "Total" | awk '{print $4}')
threshHold=500
if [[ $free_space -lt $threshHold ]]
then
	echo "ram is running low"
else
	echo "ram is sufficient - $free_space"
fi
