#!/bin/sh
# if not root, run as root
if [ $(id -u) -ne 0 ] 
then
    sudo -E $HOME/update.sh
    exit
fi
apt update
apt -y full-upgrade
apt -y autoremove
apt clean
apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')

printf "Press enter to continue..."
read _
