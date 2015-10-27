#!/bin/bash

# demander si besoin d'indice et stocker indice = true
# apprendre ctrl-a et ctrl-e et flèche du haut pour revenir aux commandes précédentes

function start_test(){
echo -e $green"HELLO SIMPLONIEN \n"$reset_color$bold

    echo -e "Quel robot lancer ?"
    echo -e "Niveau 1 : "
    echo -e "$green- 01 - Se déplacer et se retrouver ( cd , pwd, ls )"
    echo -e "- 02 - Les fichiers et dossiers ( nano, mkdir, touch )"
    echo -e "- 03 - Gestion des droits ( chmod , chown )$reset_color$bold"
    echo -e "- 04 - Renommer, copier, déplacer et supprimer ( rename, cp, mv, rm )"
    echo -e "- 05 - Télécharger des fichiers ( wget, curl )"

    echo -e "Niveau 2:"
    echo -e "- 06 - Utilisez l'historique pour gagner du temps ( history, flèches )"
    echo -e "- 07 - Espace disque et mémoire vive ( df, du, free )"
    echo -e "- 08 - Filtrer ( grep )"
    echo -e "- 09 - Rechercher / Remplacer ( sed )"
    echo -e "- 10 - Les processus ( ps, kill, killall... )"
    echo -e "- 11 - Bash avancé : cut, awk, which, wget, jobs...$reset_color$bold"
    echo -e $blue"Votre choix :"$reset_color
    read
    case "$REPLY" in
        1) echo -e "Vous avez choisis : Se déplacer et se retrouver\n"
            challenge="try"
            source bots/move.sh
        ;;         
        2) echo -e "Vous avez choisis : Les fichiers et dossiers\n"
            challenge="time" 
            source bots/files.sh
        ;;
        3) echo "Vous avez choisis : Gestion des droits sur les fichiers"
            challenge="time" 
            source bots/permission.sh
        ;;
#        4) echo "Vous avez choisis : Renommer / Déplacer" 
#            source bots/rename.sh
#        ;;
        *)
        echo "Choix pas encore disponible"
        exit
        ;;
    esac
}

function ask_challenge(){
    case "$challenge" in
        'try')
                time="5"
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
        *)
        echo "Choix pas encore disponible"
        exit
        ;;
    esac
}

function next_step(){
    step=$[step+1]
    echo -e $green"Bien, next Step"$reset_color$bold"\n"
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
