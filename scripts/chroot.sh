#!/bin/bash

clear
echo "Updating Current Directory..."
sleep 3s
cp /arc-os/scripts/package-install.sh /mnt/final-install.sh
sleep 3s
chmod +x /mnt/final-install.sh
arch-chroot /mnt ./final-install.sh
sleep 10s
clear

rm -rf /mnt ./final-install.sh

echo "Unmounting all the Drives"
umount -R /mnt
sleep 2s
clear

echo "Installation Finished. Rebooting into new System after 10 seconds!"
sleep 10s
reboot