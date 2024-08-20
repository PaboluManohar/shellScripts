#!/bin/bash

#free disk space  = fd
fd=$(df -H | grep "/dev" | awk '{print $5}' | tr -d %)

if [[ $fd -lt 80 ]]
then
	echo "disk space is sufficient"
else
	echo "disk space is running low = $fd "
fi

