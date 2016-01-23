#!/bin/bash
source $path/bots/reset.sh
verif_conf_challenge

#display_warning_new_window


function consigne(){
	case "$1" in
		1) echo "Affichez l'historique de vos dernières commandese";
		   verif=" -f /tmp/index.php"
		;;
	        2) echo "... , il vous reste";
		   verif=" -f /tmp/index2.php"
		;;
        esac
}
