#!/bin/bash

time="30"
SECS=300
source lib/color.sh
source lib/functions.sh

path=`pwd`
source $path/bots/reset.sh

level=`cat .level`

echo -e $bold

start_test

next_step=$[$SECS-$time]
win=false
game_over=false
bad_response=0
step=1

consigne $step

while [[ 0 -ne $SECS ]]; do
    if [ $win == true ]
	then
		if [ $level_selected -eq $level ]
		then
			level=$[$level_selected+1]
		fi
	        echo -e $green"YOU WIN, TRY THE LEVEL "$level$reset_color
		echo -e "$level" > $path"/.level"
		sleep 2
		menu
    fi

    if [ $game_over == true ]
	then
		echo -e $red"You lose, Game Over$reset_color"
	exit
    fi

    if [ $verif ]
    then
        if [ $read_input ]
            then
                if [ $time == ${bad_response:-0} ]
                then
                    echo -e $red"Game over"$reset_color$bold
                    game_over=true
                    break
                fi
                    echo "Quelle est la commande à taper pour faire cela ?"
                    read
                    response$step
            else if [ $test ]
            	then
                  case $test in
			"search")
	                	search_grep "$val_test" "$search_in"
                          	if [ -n "$result" ]
                          	then
                              		#next_step
#	                              	win=true
					test=""
                        	      	search_in=""
                	              	result=""
        	                      	val_test=""
                          	else
                              		next_try
                          	fi
			;;
                    	"acl")
                        	droit=`stat -c%A /tmp/contact.html`
                        	val_test=" \"${droit:4:2}\" == \"rw\" "
				if [ $val_test ]
				then
					next_step
				else
					next_try
				fi
			;;
		esac
            else
                next_step
            fi
        fi
    else
            next_try
    fi


    if [ $SECS == "$next_step" ]
    then
        game_over=true
    fi
done
echo "Time is up, clown."
