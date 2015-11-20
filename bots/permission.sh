#!/bin/bash
rm -f "/tmp/contact.html"
touch "/tmp/contact.html"
sudo chown www-data.www-data "/tmp/contact.html"

display_warning_new_window

function consigne(){
	case "$1" in
	 	1) echo -e $blue"Changer le proprietaire du fichier /tmp/contact.html actuellement en root.root en vous mettant proprietaire de ce fichier$reset_color$bold";
			verif=" -O /tmp/contact.html"
		;;
	        2) echo -e $blue"Donner les droits en ecritures "$reset_color$bold;
            		verif=" 1 = 1"
            		test="acl"
		;;
	        3)
			verif=""
			win="true"
		;;
        esac
}
