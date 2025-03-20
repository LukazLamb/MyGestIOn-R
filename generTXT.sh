#!/bin/bash

while true;do
	echo "quelles informations voulez-vous "
	echo "choix 1: le type d'equipement "
	echo "choix 2: l'idType "
	echo "choix 3: le nom de l'equipement "
	echo "choix 4: l'adresse MAC "
	echo "choix 5: l'adresse IP "
	echo "choix 6: le masque "
	echo "choix 7: la totalité des informations "
	echo "choix 0: arret du programme "
	read -p "entrez le chiffre correspondant a votre choix : " choix
	if [ "$choix" = "0" ];
	then
		echo "arret du programme."
		exit 0
	fi
	case "$choix" in

		1 )
	        	mysql -u stagiaire -p"azerty" -D MyGest -e "select Type from EQUIPEMENT;" > "Type-$(date).txt"
	        	;;

		2 )
	        	mysql -u stagiaire -p"azerty" -D MyGest -e "select idType from EQUIPEMENT;" > "idType-$(date).txt"
	        	;;

		3 )
	        	mysql -u stagiaire -p"azerty" -D MyGest -e "select nom from EQUIPEMENT;" > "nom-$(date).txt"
	        	;;

		4 )
	        	mysql -u stagiaire -p"azerty" -D MyGest -e "select Adresse_MAC from EQUIPEMENT;" > "Adresse_MAC-$(date).txt"
	        	;;

		5 )
	        	mysql -u stagiaire -p"azerty" -D MyGest -e "select Adress_Ip from EQUIPEMENT;" > "Adress_Ip-$(date).txt"
	        	;;

		6 )
	        	mysql -u stagiaire -p"azerty" -D MyGest -e "select CIDR from EQUIPEMENT;" > "Masque-$(date).txt"
	        	;;

		7 )
	        	mysql -u stagiaire -p"azerty" -D MyGest -e "select * from EQUIPEMENT;" > "totalité-$(date).txt"
	        	;;

	esac
done
