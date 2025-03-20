#!/bin/bash

read -p "est-ce la premiere utilisation du script pour votre machine ? (tapez oui sinon 'entrer') " osef

case $osef in
	oui)
		read -p "etes-vous sur une machine ou un serveur : " serveur
		if [ "$serveur" = "serveur" ];
		then
			sed -i 's/serveur=0/serveur=1/' /home/eleve/Téléchargements/myGest_IOnR/config.sh
		fi
		if [ "$serveur" = "machine" ];
		then
			sed -i 's/serveur=1/serveur=0/' /home/eleve/Téléchargements/myGest_IOnR/config.sh
		fi
		paquets=("figlet" "lolcat" "unzip" "wget" "mariadb-server" "imagemagick")

		for paquets in "${paquets[@]}"; do
			apt-get install -y "$paquets" &> /dev/null
		done
		;;

	non)

		paquets=("figlet" "lolcat" "unzip" "wget" "mariadb-server" "imagemagick")

		for paquets in "${paquets[@]}"; do
			apt-get install -y "$paquets" &> /dev/null
		done

		;;
esac
