#!/bin/bash
echo ""
echo "Veulliez saisir les informations suivantes :"
read -p "> Type (machine;seveur;switch) :" Type
read -p "> idType (1:machine; 2:seveur; 3:switch) :" idType
read -p "> Nom :" nom
read -p "> Adresse MAC :" Adresse_MAC
read -p "> Adress Ip :" Adress_Ip
read -p "> Masque (CIDR) :" CIDR
echo "On récapitule votre requete :"
echo "> INSERT INTO EQUIPEMENT (Type,idType,nom, AdMAC,AdIp,CIDR) VALUES ('$Type','$idType','$nom','$Adresse_MAC','$Adress_Ip','$CIDR');"
read -p "Confirmer l'insertion (y/n) :" confirmation
case "$confirmation" in
   ([yY][eE][sS]|[yY])
	mysql -u stagiaire --password=azerty -e "use MyGest;""INSERT INTO EQUIPEMENT (Type,idType,nom,Adresse_MAC,Adress_Ip,CIDR) VALUES ('$Type','$idType','$nom','$Adresse_MAC','$Adress_Ip','$CIDR');"
	echo "Les saisies ont été correctement enregistrées dans la base de données"
	;;
    *)
	echo "Enregistrement annulé"
 	;;
esac

