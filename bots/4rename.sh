#!/bin/bash
source $path/bots/reset.sh
verif_conf_challenge

time=30

media_files="JPG"
for i in {a..k}
do
touch /tmp/$i.$media_files
done

#display_warning_new_window

function consigne(){
	case "$1" in
		1)    echo -e "Renommer tous les fichiers /tmp/*.JPG avec l'extension .jpg";
			#force_time=true
			verif=' -f /tmp/a.jpg -a -f /tmp/b.jpg '
		;;
		2)    echo -e "Copier le fichier /tmp/index.php vers /tmp/index_copy.php";
			touch /tmp/index.php
			verif=" -f /tmp/index_copy.php"
		;;
		3)    echo -e "Déplacer le fichier /tmp/index.php en index_backup.php";
			touch /tmp/index.php
			verif=" ! -f /tmp/index.php -a -f /tmp/index_backup.php"
		;;
		4)    #display_consigne "Supprimer le fichier /tmp/index_copy.php et index_backup.php";
			verif=" ! -f /tmp/index.php -a ! -f /tmp/index_backup.php -a ! -f /tmp/index_copy.php"
		;;
		5)
			verif=""
			win=true
        esac
}
