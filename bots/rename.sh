#!/bin/bash

function consigne(){
	case "$1" in
		1)    echo "Bonjour";
			display_consigne "Renommer le fichier /tmp/index.php en index_backup.php";
		;;
	        2)    echo "Consigne 2";
		;;
        esac
}

