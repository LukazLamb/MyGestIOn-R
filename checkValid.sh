#!/bin/bash

VERT="\e[32m"
ROUGE="\e[31m"
RESET="\e[0m"

IPS=$(mysql -u stagiaire -p"azerty" -D MyGest -e "select Adress_Ip from EQUIPEMENT;" -N)

for ip in $IPS;do
	if ping -c 1 -W 1 $ip > /dev/null 2>&1; then
		echo -e "${VERT}$ip est accessible${RESET}"
	else
		echo -e "${ROUGE}$ip est injoignablee${RESET}"
	fi
done
