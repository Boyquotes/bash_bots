#!/bin/bash

# demander si besoin d'indice et stocker indice = true
# apprendre ctrl-a et ctrl-e et flèche du haut pour revenir aux commandes précédentes
function start_test(){
    echo -e $green"HELLO SIMPLONIEN \n"$reset_color$bold
    menu
}

function go(){
    level_selected=$REPLY
    case "$REPLY" in
        1) echo -e "Vous avez choisis : Se déplacer et se retrouver\n"
            challenge="try"
            source $path/bots/1move.sh
        ;;
        2) echo -e "Vous avez choisis : Les fichiers et dossiers\n"
            challenge="time"
            source $path/bots/2files.sh
        ;;
        3) echo "Vous avez choisis : Gestion des droits sur les fichiers"
            challenge="time"
            source $path/bots/3permission.sh
        ;;
        4) echo "Vous avez choisis : Renommer / Déplacer"
            challenge="time"
            source $path/bots/4rename.sh
        ;;
        5) echo "Vous avez choisis : Utilisez l'historique"
            challenge="time"
            source $path/bots/5history.sh
        ;;
        *)
        echo "Choix pas encore disponible"
        exit
        ;;
    esac
}

function menu(){
    echo -e "Quel robot lancer ?"
    echo -e "Niveau 1 : "
    echo -e "$green- 1 - Se déplacer et se retrouver ( cd , pwd, ls )"
    echo -e "- 2 - Les fichiers et dossiers ( nano, mkdir, touch )"
    echo -e "- 3 - Gestion des droits ( chmod , chown )"
    echo -e "- 4 - Renommer, copier, déplacer et supprimer ( rename, cp, mv, rm )$reset_color$bold"
    echo -e "- 5 - Utilisez l'historique pour gagner du temps ( history, flèches haut/bas, point d'exclamation)"
    echo -e "- 6 - Rechercher dans le contenu des fichiers ou filtrer ( grep )"

    echo -e "Niveau 2:"
    echo -e "- 7 - Espace disque et mémoire vive ( df, du, free )"
    echo -e "- 8 - Rechercher / Remplacer ( sed )"
    echo -e "- 9 - Les processus ( ps, kill, killall... )"
    echo -e "- 10 - Télécharger des fichiers ( wget, curl )"
    echo -e "- 11 - Bash avancé : cut, awk, which, wget, jobs...$reset_color$bold"
    echo -e $blue"Votre choix :"$reset_color$bold
    read
    if [ $REPLY -gt $level -a $level -ne 0 ]
    then
    	echo -e $red"Vous n'avez pas le niveau"
    	echo -e $red"Selectionnez un niveau inferieur ou égal à "$level$reset_color$bold
    	sleep 2
    	menu
    else
	     go
    fi
}

function verif_conf_challenge(){
    if [ -z $challenge ]
    then
      echo -e $red"Il faut configurer la variable challenge pour ce bot"$reset_color$bold
      exit
    else
      ask_challenge $challenge
    fi
}

function ask_challenge(){
    case "$challenge" in
        'try')
                time="30"
                display_challenge="essai(s)"
                echo -e $blue"Combien d'essai maximum pour chaque épreuve ? ( 5 essais par défaut )"$reset_color$bold
                echo -e "1: 2 essais"
                echo -e "2: 3 essais"
                echo -e "3: 4 essais"
                echo -e "4: 10 essais"
                echo -e $blue"Votre choix ( pour 5 essais taper entrée) :"$reset_color$bold
                read
                case "$REPLY" in
                    1)
                        time="2"
                    ;;
                    2)
                        time="3"
                    ;;
                    3)
                        time="4"
                    ;;
                    4)
                        time="10"
                    ;;
                esac
        ;;
        'time')
                display_challenge="seconde(s)"
                echo -e "Combien de temps voulez vous entre chaque épreuve ? ( 30 secondes par défaut )"
                echo -e "1: 5 secondes"
                echo -e "2: 10 secondes"
                echo -e "3: 30 secondes"
                echo -e "4: 60 secondes"
                echo -e $blue"Votre choix ( pour 30 secondes taper entrée) :"$reset_color$bold
                read
                case "$REPLY" in
                    1)
                        time="5"
                    ;;
                    2)
                        time="10"
                    ;;
                    3)
                        time="30"
                    ;;
                    4)
                        time="60"
                    ;;
                esac
        ;;
        'force_time')
        echo "Vous n'avez que $time secondes pour chaque epreuve, bienvenue au niveau 4"
        ;;
        *)
        echo "Choix pas encore disponible"
        exit
        ;;
    esac
}

function display_consigne(){
	 echo -e $blue"$1"$reset_color$bold;
}
function display_warning_new_window(){
	echo -e $red"Pour répondre à ces épreuves, il vous faut soit\n - ouvrir un nouvel onglet 'Ctrl + Shift + t'\n - ouvrir une seconde fenêtre de terminal et la placer à côté de celle-ci\n - ou utiliser un terminal(terminator par exemple) qui permet de splitter la fenetre actuelle horizontalement ou verticalement"$reset_color$bold
}

function next_step(){
    step=$[step+1]
    echo -e $green"Bien, next Step"$reset_color$bold"\n"
    time="30"
    consigne $step
    WARNING=""
    tempo=""
    next_step=$[$SECS-$time]
}

function next_try(){
    sleep 1
    SECS=$[$SECS-1]
    WARNING=$[$WARNING+1]
    ESSAI=$[$time-$WARNING]
    echo "Reste : "$ESSAI $display_challenge
    if [ $WARNING == "10" ]
    then
	consigne $step
	if [ -z $tempo ]
     	then
        	tempo=$(($time-$WARNING))
     	else
        	tempo=$(($tempo-$WARNING))
    	fi
    fi
}

function search_grep(){
    result=`grep -i "$1" "$2"`
}
