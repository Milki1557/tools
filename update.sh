#!/usr/bin
#Copyright 2024 Milki 1557
#Written by: Milki1557_
#Telegram: Milki1557

# Installer Milk Tools

# colors
red='\e[1;31m'
default='\e[0m'
yellow='\e[0;33m'
orange='\e[38;5;166m'
green='\033[92m'

# location
path=$(pwd)

# Check root 
if [ "$(id -u)" != "0" ] > /dev/null 2>&1; then
echo -e '\n$red[x] Este script necesita permisos root.' 1>&2
exit
fi

# Banner
clear
sleep 2
echo -e "$yellow  ____ ___            .___                                 "
echo -e "$yellow |    |   \______   __| _/____ _/  |_  ____                "
echo -e "$yellow |    |   /\____ \ / __ |\__  \\   __\/ __ \               "
echo -e "$yellow |    |  / |  |_> > /_/ | / __ \|  | \  ___/               "
echo -e "$yellow |______/  |   __/\____ |(____  /__|  \___  > /\  /\  /\   "
echo -e "$yellow           |__|        \/     \/          \/  \/  \/  \/   "
echo -e "                                                                  "
echo -e "$orange                    Update Tools   v1.0                    "
echo -e "                                                                  "
echo -e "$orange                         Milk1557                          "

# Check if there is an internet connection
ping -c 1 google.com > /dev/null 2>&1
if [[ "$?" == 0 ]]; then
echo ""
echo -e "$green[✔][Internet Connection]............[ OK ]"
sleep 1.5
else
echo ""
echo -e "$red[!][Internet Connection].........[ NOT FOUND ]"
echo ""
exit
fi

# Creating temporary directory...
if [ -d tools ] && [ -d output ]; then
echo -e "$yellow"
echo -n [*] Creando directorio temporal...= ;
sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done 
echo ""
temp="$HOME/hacktemp"
mkdir "$temp"
mv "$path/output" "$temp/output" 
mv "$path/tools" "$temp/tools"
echo ""
echo -e "$green[✔] Done."
sleep 1.5
fi

# Updating Tools ...
echo -e "$yellow"
echo -n [*] Please Contact Tele @Milki1557 = ;
sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done 
echo -e "$green"
echo ""
git config --global pull.rebase true
git reset HEAD --hard
git pull origin master
sleep 1.5

# Moving the files in the temporary directory again
if [ -d $HOME/hacktemp ]; then
echo -e "$yellow"
echo -n [*] Proses Update ...= ;
sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done 
echo ""
mv "$temp/output" "$path/output"
mv "$temp/tools" "$path/tools"
rm -rf "$temp"
echo ""
echo -e "$green[✔] Done."
sleep 1.5
fi

# Running installer
echo -e "$yellow"
echo -n [*] Proses Installer...= ;
sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done 
bash install.sh
exit 
