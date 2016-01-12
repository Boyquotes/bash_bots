#!/bin/bash
source $path/bots/reset.sh
verif_conf_challenge

function consigne(){
	case "$1" in
		1)	echo -e "Vous aurez"
            echo -e "$blue"$consigne"$red" $time"$blue essai(s)$reset_color$bold pour chaque epreuve"
		    		echo -e $blue"Allez dans le repertoire /tmp/"$reset_color$bold;
		    		read_input=1
		    		verif=" 1 = 1"
		;;
    2)	echo -e $blue"Lister le contenu du répertoire ou vous êtes actuellement"$reset_color$bold;
            bad_response=""
		    		read_input=1
		    		verif=" 1 = 1"
		;;
		3)	echo -e $blue"Afficher le chemin du repertoire où vous vous trouvez actuellement"$reset_color$bold;
        		bad_response=""
		    		read_input=1
		    		verif=" 1 = 1"
		;;
  esac
}

function response1(){
        case "$REPLY" in
            'cd /tmp') echo -e "Bien !\n"
					            cd "/tmp"
					            step=$[step+1]
					            echo -e $green"Bien, étape suivante"$reset_color$bold"\n"
					            consigne $step
					            WARNING=""
					            tempo=""
					            next_step=$[$SECS-$time]
            ;;
            'cd /tmp/') echo -e "Bien !\n"
					            cd "/tmp"
					            step=$[step+1]
					            echo -e $green"Bien, étape suivante"$reset_color$bold"\n"
					            consigne $step
					            WARNING=""
					            tempo=""
					            next_step=$[$SECS-$time]
            ;;
            'cd ../../tmp') echo -e "Bien, étape suivante\n"
					            cd "/tmp"
					            step=$[step+1]
					            echo -e $green"Bien, étape suivante"$reset_color$bold"\n"
					            consigne $step
					            WARNING=""
					            tempo=""
					            next_step=$[$SECS-$time]
            ;;
            *)
					            echo -e $red"Mauvaise réponse$reset_color$bold"
					            bad_response=$[bad_response+1]
					            next_try
					            continue
            ;;
        esac
}

function response2(){
        case "$REPLY" in
            'ls') echo -e "Bien !\n"
            ls
            step=$[step+1]
            echo -e $green"Bien, étape suivante"$reset_color$bold"\n"
            consigne $step
            WARNING=""
            tempo=""
            next_step=$[$SECS-$time]
            ;;
            'ls .') echo -e "Bien !\n"
            ls
            step=$[step+1]
            echo -e $green"Bien, étape suivante"$reset_color$bold"\n"
            consigne $step
            WARNING=""
            tempo=""
            bad_response=""
            next_step=$[$SECS-$time]
            ;;
            'ls ./') echo -e "Bien !\n"
            ls
            step=$[step+1]
            echo -e $green"Bien, étape suivante"$reset_color$bold"\n"
            consigne $step
            WARNING=""
            tempo=""
            bad_response=""
            next_step=$[$SECS-$time]
            ;;
            *)
            echo -e $red"Mauvaise réponse$reset_color$bold"
            bad_response=$[bad_response+1]
            next_try
            continue
            ;;
        esac
}

function response3(){
        case "$REPLY" in
            'pwd')
            pwd
            bad_response=""
            win=true
            ;;
            *)
            echo -e $red"Mauvaise réponse$reset_color$bold"
            bad_response=$[bad_response+1]
            continue
            ;;
        esac
}
