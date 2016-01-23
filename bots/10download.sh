#!/bin/bash
source $path/bots/reset.sh
verif_conf_challenge

display_warning_new_window

function consigne(){
	case "$1" in
		1)    display_consigne "Télécharger le fichier à cette url http://localhost et le déposer dans /tmp/site.html ";
			verif=' -f /tmp/site.html '
		        test="search"
        		val_test="<html"
		        search_in="/tmp/site.html"
		;;
		2)    display_consigne "Aspirer ce site, seulement la categorie partenaire http://simplon.co/ils-font-simplon-co-avec-nous/ et le déposer dans /tmp/site/";
			verif=" -f /tmp/site/"
#wget -mnp http://localhost/simplon/PHP_MYSQL/"
		;;
		3)    display_consigne "Déplacer le fichier /tmp/index.php en index_backup.php";
			touch /tmp/index.php
			verif=" ! -f /tmp/index.php -a -f /tmp/index_backup.php"
		;;
		4)    display_consigne "Supprimer le fichier /tmp/index.php, /tmp/index_copy.php et index_backup.php";
			verif=" ! -f /tmp/index.php -a ! -f /tmp/index_backup.php -a ! -f /tmp/index_copy.php"
		;;
		5)
			win=true
        esac
}
