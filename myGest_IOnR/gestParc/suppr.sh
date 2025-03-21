#!/bin/bash
echo ""
read -p "Donner le nom de l'équipement que vous souhaitez supprimer :" nom
mysql -u stagiaire --password=azerty -e "use MyGest;""select * from EQUIPEMENT where nom='$nom'";
read -p "Confirmer la suppression (y/n) :" suppression
case "$suppression" in
   ([yY][eE][sS]|[yY])
	mysql -u stagiaire --password=azerty -e "use MyGest;""delete from EQUIPEMENT where nom='$nom'";
	echo "Les données ont bien été supprimées de la base de donneés"
	;;
   ([nN][oO]|[nN])
	echo "FIn de la suppression"
	;;
    *)
	echo "Erreur de saisie"
	;;
esac
