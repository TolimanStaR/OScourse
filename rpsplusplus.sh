#!/bin/bash

greeting () {
	echo '##################################################################'
	echo '#                                                                #'
	echo '# Привет, и добро пожаловать в игру "Камень - ножницы - бумага"  #'
	echo '#                                                                #'
	echo '##################################################################'
}

farewell () {
	echo '##############################'
	echo '#                            #'
	echo '# До скорых встреч, друг.    #'
	echo '#                            #' 
	echo '##############################'
}

next_step () {
	echo '
		Сделайте ход:

		Камень - нажмите "A"
		Ножницы - нажмите "S"
		Бумага - нажмите "D"

	'
}

rock () {

	echo '  
				%###-        
			    .:@#######*      
			  .@#####@@###@#+   
			 .##########@####+- 
			.#####:.*%#+#######%.
			 +########%=##@###%..
			  .@############@#+ 
			    -#############:  
			      =##########=  
			       #########-   
			      .########+     
			      *########*    
			      #########+  


			▩ ▩  ▩  ▩   ▩ ▩▩▩ ▩ ▩ ▩
			▩ ▩ ▩ ▩ ▩▩ ▩▩ ▩   ▩ ▩ ▩
			▩▩  ▩▩▩ ▩ ▩ ▩ ▩▩▩ ▩▩▩ ▩▩▩
			▩ ▩ ▩ ▩ ▩   ▩ ▩   ▩ ▩ ▩ ▩
			▩ ▩ ▩ ▩ ▩   ▩ ▩▩▩ ▩ ▩ ▩▩▩

	'   
}

snipper () {
	echo ' 
			      :*            *:      
			     :##=          =##:     
			     .###%        %###.     
			      .###@      @###.      
			        ####    ####        
			         ####..####         
			          @######@          
			           @####@           
			           *####*           
			          =######=          
			     *@######==######@*     
			   =##@*+####  ####+*@##=   
			  =##    -##*  *##-    ##=  
			  ##+    =##    ##=    +##  
			  :##=:=##@      @##=:=##*  
			    +###+          +###+  


		    ▩ ▩ ▩▩▩ ▩ ▩ ▩ ▩ ▩ ▩  ▩ ▩ ▩  ▩   ▩
		    ▩ ▩ ▩ ▩ ▩ ▩ ▩ ▩ ▩ ▩ ▩▩ ▩ ▩  ▩   ▩
		    ▩▩▩ ▩ ▩ ▩▩▩▩▩ ▩▩▩ ▩▩ ▩ ▩ ▩  ▩▩▩ ▩
		    ▩ ▩ ▩ ▩ ▩ ▩ ▩ ▩ ▩ ▩▩ ▩ ▩ ▩  ▩ ▩ ▩
		    ▩ ▩ ▩▩▩ ▩ ▩ ▩ ▩ ▩ ▩  ▩ ▩▩▩▩ ▩▩▩ ▩

	'
}

paper () {
	echo '
		    ######################-    
		   .#+                  .#*    
		    #+                  .#+    
		    #=  :+===========+   #+    
		    #=  -*:::::::::::-   #=    
		    #=   ............    #%    
		    #%  =############@   #@    
		    #%   ------------.   @@    
		    #%  .%%%%%%%%%%%%=   @#    
		    #@                   %#    
		    @@  -#############.  =#    
		    @@                ::.=#.   
		    @#               *#++##    
		    @#               :#:.#=    
		    @#             -%####-     
		    +#######@@%%%==+*-  


		    ▩▩▩ ▩ ▩ ▩   ▩ ▩▩▩ ▩▩▩ ▩▩▩
		    ▩   ▩ ▩ ▩▩ ▩▩ ▩ ▩ ▩   ▩ ▩
		    ▩▩▩ ▩▩▩ ▩ ▩ ▩ ▩▩▩ ▩   ▩▩▩
		    ▩ ▩   ▩ ▩   ▩ ▩ ▩ ▩   ▩ ▩
		    ▩▩▩ ▩▩▩ ▩   ▩ ▩ ▩ ▩   ▩ ▩

	'
}

magic_table=(0  0 0 0 0  0  0 0 0 0  # 0
			 0  0 0 0 0  0  0 0 0 0  # 1
			 0 -1 1 0 0  0 -1 0 0 0  # 2
			 0  0 0 0 0  1  0 0 0 1  # 3
			 0  0 0 0 0  0  0 0 0 0  # 4
			 0  0 0 0 0 -1  0 0 0 0  # 5
			 0  0 0 0 0  0  0 0 0 0) # 6


main () {
	greeting

	while [[ true ]]; do
		next_step

		# while [[ true ]]; do
		# 	if [[ $(sudo cat /dev/input/event8) = "�k_h�+^" ]]; then
		# 	fi
		# done

		player_decision=-1
		index=$RANDOM%3
		primes=(7 11 13)
		computer_decision=primes[index]

		while [[ true ]]; do

			read -rsn1 key

			if [[ "$key" = "a" ]]; then
				echo '		Ваш ход - КАМЕНЬ'
				let player_decision=2
				break

			elif [[ "$key" = "s" ]]; then
				echo '		Ваш ход - НОЖНИЦЫ'
				let player_decision=3
				break 

			elif [[ "$key" = 'd' ]]; then
				echo '		Ваш ход - БУМАГА'
				let player_decision=5
				break
			fi
		done

		if [[ $RANDOM%4 -eq 0 ]]; then  # Вот такой вот простой хитреж со стороны компьютера
			if [[ "$player_decision" -eq 2 ]]; then
				paper
			elif [[ "$player_decision" -eq 3 ]]; then
				rock
			elif [[ "$player_decision" -eq 5 ]]; then
				snipper
			fi
			echo '
		Вы проиграли.
			'
			exit
		fi

		echo '
		ВЫБОР КОМПЬЮТЕРА:
		'
		if [[ "$computer_decision" -eq 7 ]]; then
			rock
		elif [[ "$computer_decision" -eq 11 ]]; then
			snipper
		elif [[ "$computer_decision" -eq 13 ]]; then
			paper
		fi


		if [[ magic_table["$player_decision*$computer_decision"] -eq 0 ]]; then
			echo '
		Оба игрока выбрали одинаковый вариант. Игра продолжается
			'
		elif [[ magic_table["$player_decision*$computer_decision"] -eq -1 ]]; then
			echo '
		Вы проиграли.
			'
			break
		elif [[ magic_table["$player_decision*$computer_decision"] -eq 1 ]]; then
			echo '
		Поздравляем, вы выиграли!!!
			'
			break
		fi
	done

	farewell
}

main
