#!/bin/bash

rm -rf /tmp/myscript.sh rm -rf /tmp/*.ogg touch /tmp/ma_page.php


media_files="ogg" 
for i in {1..10} 
do
touch /tmp/$i.$media_files
done


function consigne(){
	case "$1" in
		1) echo -e "Allez dans le repertoire /tmp/ et crée un fichier 
myscript.sh, Vous avez $time secondes";
		   verif=" -f /tmp/myscript.sh"
		;;
        2) echo -e "Ecrivez 'Hello command line' dans le fichier myscript.sh";
            verif=" 1 = 1"
            test=1
            val_test="hello command line"
            search_in="/tmp/myscript.sh"
		;;
        esac
}
