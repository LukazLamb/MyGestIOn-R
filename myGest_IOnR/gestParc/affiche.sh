#!/bin/bash

#import des config et fonctions
source config.sh
source fonction.sh
 
quitter=1
while [[ $quitter -ne 0 ]]
do
echo -e "Que souhaiter vous consulter :"
echo "1) Toutes les informations "
echo "2) Seulement les machines"
echo "3) Seulement les serveurs"
echo "4) Seulement les switch"
echo "0) Quitter"
echo -e "Veulliez choisir une option :"
read choix
case $choix in
	1)
		bash gestParc/fichier.sql
		;;
	2)
		bash gestParc/fichier_machine.sql
		;;
	3)
		bash gestParc/fichier_serveur.sql
		;;
	4)
		bash gestParc/fichier_swicth.sql
		;;
	0)
		quitter=0
		;;
	*)
		echo "Erreur de saisie"
		;;
esac
done

