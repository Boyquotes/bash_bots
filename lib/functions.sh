#!/bin/bash

# demander si besoin d'indice et stocker indice = true
# apprendre ctrl-a et ctrl-e et flèche du haut pour revenir aux commandes précédentes

function start_test(){
    echo -e "Quel robot lancer ?"
    echo -e "Niveau 1 : "
    echo -e "$green- 1 - Se déplacer et se retrouver ( cd , pwd, ls )"
    echo -e "- 2 - Les fichiers et dossiers ( nano, mkdir, touch )"
    echo -e "- 3 - Gestion des droits ( chmod , chown )$reset_color$bold"
    echo -e "$reset_color$grey- 4 - Renommer, déplacer et supprimer ( rename, mv, rm )"
    echo -e "- 5 - Télécharger des fichiers ( wget, curl )"

    echo -e "Niveau 2:"
    echo -e "- 5 - Utilisez l'historique pour gagner du temps ( history, flèches )"
    echo -e "- 6 - Espace disque et mémoire vive ( df, du, free )"
    echo -e "- 6 - Filtrer ( grep )"
    echo -e "- 7 - Rechercher / Remplacer ( sed )"
    echo -e "- 8 - Les processus ( ps, kill, killall... )"
    echo -e "- 9 - Bash avancé : cut, awk, which, wget, jobs...$reset_color$bold"
    echo -e "Votre choix :"
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
                echo -e "Combien d'essai maximum pour chaque épreuve ? ( 5 essais par défaut )"
                echo -e "1: 2 essais"
                echo -e "2: 3 essais"
                echo -e "3: 4 essais"
                echo -e "4: 10 essais"
                echo -e "Votre choix ( pour 5 essais taper entrée) :"
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
                echo -e "3: 20 secondes"
                echo -e "4: 40 secondes"
                echo -e "Votre choix ( pour 30 secondes taper entrée) :"
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
