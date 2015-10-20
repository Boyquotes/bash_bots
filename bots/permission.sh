#!/bin/bash

function consigne(){
	case "$1" in
		1) echo "Changer le proprietaire du fichier .nano_history en root root";
		   verif=" -f /tmp/index.php"
		;;
        2) echo "Donner les droits en ecritures ";
		   verif=" -f /tmp/index2.php"
		;;
        esac
}
