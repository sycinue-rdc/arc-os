#!/bin/bash

clear
echo "Base Installation Getting Started..."
sleep 3s
clear

# - Kernel Installation - #
echo "Installing Linux Base System..."
sleep 5s
pacstrap /mnt base dmidecode f2fs-tools hyperv less linux-lts linux-lts-headers man-db man-pages mtools pv sudo syslinux tmux curl git wget sof-firmware gpm open-vm-tools efibootmgr grub broadcom-wl dhclient dhcpcd ethtool gnu-netcat iw iwd lynx modemmanager ndisc6 networkmanager nfs-utils openconnect openssh openvpn reflector tcpdump wireless-regdb wireless_tools wpa_supplicant wvdial dmraid hdparm libfido2 libusb-compat lvm2 mdadm nbd ntfs-3g nvme-cli reiserfsprogs sdparm sg3_utils smartmontools udftools usb_modeswitch usbmuxd usbutils nilfs-utils rsync testdisk vim
sleep 10s
clear

## Restoring the Pacman Signature Checks/Verification Option
echo "Restoring the Pacman Signature Checks"
sleep 3s
cp /etc/pacman.conf.tmp /etc/pacman.conf
rm -rf /etc/pacman.conf.tmp
sleep 5s
clear
echo "Checking the pacman.conf"
sleep 3s
cat /etc/pacman.conf
sleep 5s
clear

echo "Linux Base System Installation Complete..."
sleep 5s
clear

echo "Generating Fstab file"
genfstab -U /mnt >> /mnt/etc/fstab
sleep 5s
clear

exec /arc-os/scripts/chroot.sh