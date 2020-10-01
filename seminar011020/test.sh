#!/bin/bash

greeting () {
	echo '
	###
	### Welcome to the Toligram! (TolimanStaR inc.)
	### 
	### All rights reserved (2020-∞)
	###
	'
}

write_message () {
	openssl enc -d -aes-256-cbc -in message.enc -out dmessage.txt -k $pass 2>/dev/null

	echo '
	Message is:
	'
	cat message.txt
	echo '
	Enter your message -> 
	'
	rm message.txt
	rm message.enc
}

trap 'write_message' 2

ps -a
echo 'Enter mate pid:'
read mate
echo 'Enter password:'
read pass 

while [[ true ]]; do
	echo '
	Enter your message ->
	'
	read message 
	echo $message > message.txt
	openssl enc -aes-256-cbc -salt -in message.txt -out message.enc -k $pass 2>/dev/null
	kill -s 2 $mate
done
