#!/bin/bash
source $path/bots/reset.sh
verif_conf_challenge

display_warning_new_window

function consigne(){
	case "$1" in
	 	1) echo -e $blue"Changer le proprietaire du fichier /tmp/contact.html actuellement en root.root en vous mettant proprietaire de ce fichier$reset_color$bold";
			verif=" -O /tmp/contact.html"
		;;
	        2) echo -e $blue"Donner les droits en ecritures au groupe sur le fichier /tmp/contact.html"$reset_color$bold;
            		verif=" 1 = 1"
            		test="acl"
		;;
	        3)
			verif=""
			win="true"
		;;
        esac
}
