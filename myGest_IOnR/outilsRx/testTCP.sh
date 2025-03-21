#!/bin/bash

while true; do
	port_correct=0;
	ip_correct=0;
	read -p "entrez une adresse IP et le port à tester ('IP' 'port'): " ip port
	octet1=$(echo $ip | cut -d '.' -f 1)
	octet2=$(echo $ip | cut -d '.' -f 2)
	octet3=$(echo $ip | cut -d '.' -f 3)
	octet4=$(echo $ip | cut -d '.' -f 4)

	if [ "$octet1" -ge 0 ] && [ "$octet1" -le 255 ] && [ "$octet2" -ge 0 ] && [ "$octet2" -le 255 ] &&  [ "$octet3" -ge 0 ] && [ "$octet3" -le 255 ] &&  [ "$octet4" -ge 0 ] && [ "$octet4" -le 255 ];
	then
		ip_correct=1
	else
		ip_correct=2
	fi
	if [ "$port" -ge 0 ] && [ "$port" -le 65535 ];
	then
		port_correct=1
	else
		port_correct=2
	fi
	if [ "$ip_correct" -eq 1 ] && [ "$port_correct" -eq 1 ];
	then
		read -p "IP et port correct, voulez tester le port (entrez oui) ? " oui
		if [ "$oui" = "oui" ];
		then
			nc -zv $ip $port > /dev/null 2>&1
			if [ $? -eq 0 ];
			then
				echo "Le port $port sur l'adresse IP $ip est ouvert."
			else
				echo "Le port $port sur l'adresse IP $ip est fermé."
			fi
		fi
	fi
	read -p "Entrez 'stop' pour arreter sinon appuyer sur la touche 'entrée' : " stop
	if [ "$stop" = "stop" ];
	then
		echo "arret du programme."
		exit 0
	fi
done
