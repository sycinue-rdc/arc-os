#!/bin/bash

clear
sleep 1s
echo "Installer Initializing..."
sleep 2s
chmod +x /arc-os/installer/build/scripts/*

sleep 1s
clear

echo "To avoid Package Signature error while installing, We will be disabling the Package Signature check during the whole Installation Process..."
sleep 10s
## To avoid any Signature Error While Installating Packages
cp /etc/pacman.conf /etc/pacman.conf.tmp
echo "SigLevel = Never" >> /etc/pacman.conf
sleep 5s
clear
echo "Checking the pacman.conf"
sleep 3s
cat /etc/pacman.conf

sleep 10s

clear
exec /arc-os/scripts/pre-install_config.sh