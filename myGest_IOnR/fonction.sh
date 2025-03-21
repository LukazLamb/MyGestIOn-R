#!/bin/bash
source config.sh

# fonction pour afficher les titres
function afficheTitre () {
    if (( $serveur == "1" ))
    then
        echo $1
    else
        echo $1 |lolcat |figlet
    fi

}
