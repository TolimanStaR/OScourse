#!/bin/bash


ans=$(($RANDOM%100))
try=10

while true; do
	read number
	let try=try-1
	if [ "$try" -eq 0 ]; then
		echo 'Попытки кончились, Навальный...'
		exit
	fi
	if [ "$number" -eq "$ans" ]; then
		echo 'Ты победил'
		exit
	elif [ "$number" -gt "$ans" ]; then
		echo 'Твое число больше'
	elif [ "$number" -lt "$ans" ]; then
		echo 'Твое число меньше'
	else
		echo 'Ты не угадал, давай снова'
	fi
done



