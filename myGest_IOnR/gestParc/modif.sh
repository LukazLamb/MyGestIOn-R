#!/bin/bash
echo ""
read -p "Donner le nom de l'équipement à modifier :" nom
mysql -u stagiaire --password=azerty -e "use MyGest;""select * from EQUIPEMENT where nom='$nom'";
read -p "> Type (machine;seveur;switch) :" Type
read -p "> idType (1:machine; 2:seveur; 3:switch) :" IdType
read -p "> Nom :" nom
read -p "> Adresse MAC :" Adresse_MAC
read -p "> Adress Ip :" Adress_Ip
read -p "> Masque (CIDR) :" CIDR
echo "On récapitule votre requete :"
echo "> UPDATE EQUIPEMENT SET Type='$Type', idType='$IdType', nom='$nom', Adresse_MAC='$Adresse_MAC', Adress_Ip='$Adress_Ip', CIDR='$CIDR' WHERE nom='$nom'";
read -p "> Confirmer la modification (Y/n) :" modification
case "$modification" in
   [yY][eE][sS]|[yY])
        mysql -u stagiaire --password=azerty -e "use MyGest;""update EQUIPEMENT set Type='$Type', idType='$IdType', nom='$nom', Adresse_MAC='$Adresse_MAC', Adress_Ip='$Adress_Ip', CIDR='$CIDR' where nom='$nom';"
        echo "Les données ont bien été modifiées de la base de donneés"
        ;;
   [nN][oO]|[nN]|[nN])
        echo "FIn de la modification"
        ;;
    *)
        echo "Erreur de saisie"
        ;;
esac
