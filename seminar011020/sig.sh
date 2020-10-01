#!/bin/bash



# write_message () {
# 	echo '
# 	Message is:
# 	'
# 	cat message.txt
# }

# trap 'write_message' 2 

# while [[ true ]]; do
# 	sleep 1
# done


# trap '' 1 


# kill -s 1 $pid


for x in `ps -a`; do
	for y in $x; do
		echo $y
	done
done
