#!/bin/bash


time="30"
SECS=300

source lib/color.sh
source lib/functions.sh

echo -e $bold

start_test
ask_challenge $challenge

next_step=$[$SECS-$time]
win=false
game_over=false
bad_response=0
step=1

consigne $step

while [[ 0 -ne $SECS ]]; do
    if [ $win == true ]
    then
        echo -e $green"You win, try next level"$reset_color
        exit
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
                    search_grep "$val_test" "$search_in"
                        if [ -n "$result" ]
                        then
                            #next_step
                            win=true
                            result=""
                            val_test=""
                            search_in=""
                        else
                            next_try
                        fi
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
