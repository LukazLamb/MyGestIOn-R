#!/bin/bash

while true; do
	ip_correct=0;
	read -p "entrez une adresse IP : " ip
	octet1=$(echo $ip | cut -d '.' -f 1)
	octet2=$(echo $ip | cut -d '.' -f 2)
	octet3=$(echo $ip | cut -d '.' -f 3)
	octet4=$(echo $ip | cut -d '.' -f 4)

	if [ "$octet1" -ge 0 ] && [ "$octet1" -le 255 ] && [ "$octet2" -ge 0 ] && [ "$octet2" -le 255 ] && [ "$octet3" -ge 0 ] && [ "$octet3" -le 255 ] &&  [ "$octet4" -ge 0 ] && [ "$octet4" -le 255 ];
	then
		ip_correct=1
	else
		ip_correct=2
	fi

	if [ "$ip_correct" -eq 1 ];
	then
		read -p "IP valide, voulez-vous maintenant tester si votre ip est active (tapez oui')? " oui
		if [ "$oui" = "oui" ];
		then
			ping -c 4 "$ip" > /dev/null 2>&1
			if [ $? -eq 0 ];
			then
				echo "Le ping à $ip est reussi."
			else
				echo "Le ping à $ip a echoué."
			fi
		fi
	else
		echo "IP non-valide, veuillez entrée un IP correct."
	fi
	read -p "Entrez 'stop' pour arreter sinon appuyer sur la touche 'entrée' : " stop
	if [ "$stop" = "stop" ];
	then
		echo "arret du programme."
		exit 0
	fi
done
