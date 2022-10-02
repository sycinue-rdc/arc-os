#!/bin/bash

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
sleep 5s

clear
echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 2s
echo "Setting Timezone"
ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
hwclock --systohc
sleep 1s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 2s
echo "en_PH.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
sleep 1s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 2s
echo "Setting-up LANG"
echo "LANG=en_PH.UTF-8" > /etc/locale.conf
sleep 1s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 2s
echo "Setting Console Keyboard Layout"
echo "KEYMAP=us" > /etc/vconsole.conf
sleep 1s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 2s
#echo "Set up your hostname!"
#echo "Enter your computer name: "
#read hostname
#echo $hostname > /etc/hostname
#clear
echo "ARC" > /etc/hostname
sleep 1s
echo "Checking Hostname (/etc/hostname)"
echo
cat /etc/hostname
sleep 1s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 2s
echo "Setting up hosts file"
echo "127.0.0.1       localhost" >> /etc/hosts
echo "::1             localhost" >> /etc/hosts
echo "127.0.1.1       $hostname" >> /etc/hosts
echo
echo
echo "Checking /etc/hosts file"
cat /etc/hosts
sleep 1s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 2s
echo "Installing A.R.C System packages"
echo
sleep 5s
pacman -S --noconfirm acpi binutils fakeroot gtk-engine-murrine gvfs gvfs-mtp gvfs-afc gvfs-gphoto2 gvfs-smb gvfs-google inotify-tools make patch powertop python sshfs udisks2 wmctrl xclip xdotool yad
sleep 10s
clear

echo "Installing A.R.C System Utilities packages"
echo
sleep 5s
pacman -S --noconfirm inetutils networkmanager-openvpn nethogs nm-connection-editor bluez bluez-utils blueman pulseaudio-bluetooth alsa-plugins alsa-tools alsa-utils pavucontrol pulseaudio pulseaudio-alsa pulseaudio-equalizer-ladspa viewnior ffmpeg ffmpegthumbnailer tumbler alacritty xfce4-terminal geany geany-plugins ranger highlight trash-cli ueberzug thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman zip p7zip unzip unrar xarchiver xdg-user-dirs xdg-user-dirs-gtk
sleep 10s
clear

echo "Installing A.R.C Window Manager"
echo
sleep 5s
pacman -S --noconfirm xorg sddm xorg-xinput xf86-input-libinput bspwm sxhkd picom baobab dialog dunst feh lxappearance ncdu nitrogen rofi maim xfce4-power-manager xfce4-settings xsettingsd htop base-devel
sleep 10s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 3s 
echo "Running System Configuration..."
echo
sleep 2s

echo "Enabling NetworkManager"
systemctl enable NetworkManager
sleep 2s
systemctl NetworkManager status
sleep 5s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 3s 
echo "Enter password for root user:"
passwd
sleep 2s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 3s 
echo "Adding home user!"
echo
echo "Enter username to add a home user: "
read username
useradd -m -g users -G wheel,audio,video -s /bin/bash $username
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 3s
echo "Enter password for "$username": "
passwd $username
sleep 2s
echo
echo "Giving sudo access to "$username"!"
echo "$username ALL=(ALL) ALL" >> /etc/sudoers.d/$username
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 3s
echo "Packages Installation Complete..."
sleep 3s
clear

echo "Installing grub"
sleep 2s
pacman -Sy --needed --noconfirm grub efibootmgr networkmanager
clear

lsblk
echo
echo "Enter the boot partition to install bootloader. (eg: /dev/sda#): "
read efipartition
efidirectory="/boot/efi/"
if [ ! -d "$efidirectory" ]; then
  mkdir -p "$efidirectory"
fi
mount "$efipartition" "$efidirectory"
clear

lsblk
echo
echo "Installing grub bootloader in /boot/efi parttiton"
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable
grub-mkconfig -o /boot/grub/grub.cfg
sleep 5s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 3s
echo "Executing System Update..."
echo
pacman -Syyu
sleep 10s
echo
echo "Restoring the Pacman Signature Checks"
sleep 10s
cp /etc/pacman.conf.tmp /etc/pacman.conf
rm -rf /etc/pacman.conf.tmp
sleep 5s
clear
echo "Checking the pacman.conf"
sleep 3s
cat /etc/pacman.conf
sleep 5s
clear

echo -ne "__________________________________________________________________________
|                                                                        |
|                   █████         ██████          ██████                 |
|                  ██   ██        ██   ██        ██                      |
|                  ███████        ██████         ██                      |
|                  ██   ██        ██   ██        ██                      |
|                  ██   ██   ██   ██   ██   ██    ██████                 |
|                                                                        |
|------------------------------------------------------------------------|
|                 A.R.C Linux Distribution by Sycinue-rdc                |
|              For more information about this project visit             |
|                  https://github.com/sycinue-rdc/arc-os                 |
|                                                                        |
|                     Copyright (C) 2022 Sycinue-rdc                     |
|------------------------------------------------------------------------|
|________________________________________________________________________|

"
sleep 3s
clear
echo "Installation Complete..."