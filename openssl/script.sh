#!/bin/bash

main () {
	rm number.txt > /dev/null
	echo 'Введите пароль для зашифрованного файла >>> '
	read password
	openssl enc -d -aes-256-cbc -in number.enc -out number.txt -k $password 2> /dev/null

	number=`cat number.txt`
	if [[ $? -ne 0 ]]; then
		echo 'Неправильный пароль'
		exit
	fi

	while [[ true ]]; do
		echo '
		Введите число от 0 до 100
		'
		read in 
		if [[ "$in" -eq "$number" ]]; then
			echo '
			Победа за вами.
			'
			break
		elif [[ "$in" -gt "$number" ]]; then
			echo '
			Число больше, чем нужно
			'
		elif [[ "$in" -lt "$number" ]]; then
			echo '
			Число меньше, чем нужно
			'
		else
			echo '
			Вы не угадали.
			'
		fi
	done
	rm number.txt
}

main
