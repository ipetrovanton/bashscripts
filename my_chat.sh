#!/bin/bash

#func: read file to str; show str and del file
#called by trap
my_func(){
	s=`cat message.txt`
	echo message from $PID:
	echo $s
	rm message.txt
	echo Write some letter for $PID
}

#trap used for react on signal
trap "my_func" SIGUSR1

#show own PID and request for PID of destination point
echo My PID is $$
read -p 'Input PID of my partner: ' PID

#main loop: request for text for letter
#			write it in message.txt file
#			request action by SIGUSR1 for some process by PID
while true
do  
    echo Write some letter for $PID
	read message
	echo $message >> message.txt
	kill -SIGUSR1 $PID
done