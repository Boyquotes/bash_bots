#!/bin/bash
source $path/bots/reset.sh
verif_conf_challenge

media_files="ogg"
for i in {1..10}
do
touch /tmp/$i.$media_files
done

display_warning_new_window

function consigne(){
	case "$1" in
	1) echo -e $blue"Allez dans le repertoire /tmp/ et crée un fichier myscript.sh, Vous avez $time secondes"$reset_color$bold;
	   verif=" -f /tmp/myscript.sh"
	;;
        2) echo -e $blue"Ecrivez 'Hello command line' dans le fichier myscript.sh"$reset_color$bold;
            verif=" 1 = 1"
            test="search"
            val_test="hello command line"
            search_in="/tmp/myscript.sh"
	    win="true"
	;;
        esac
}
