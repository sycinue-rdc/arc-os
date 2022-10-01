clear
echo -ne "
__________________________________________________________________________
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
echo "Internet Connection is a must to begin."
echo "Updating Keyrings"
sleep 2s
pacman -Sy --needed --noconfirm archlinux-keyring
clear

echo -ne "
__________________________________________________________________________
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
echo "Ensuring if the system clock is accurate."
timedatectl set-ntp true
sleep 3s
clear

# - - Partitioning Section - - #

lsblk
echo "Enter the drive to install A.R.C linux on it. (/dev/...)"
echo "Enter Drive (eg. /dev/sda or /dev/vda or /dev/nvme0n1 or something similar)"
read drive
sleep 2s
clear

lsblk
echo "Choose a familier disk utility tool to partition your drive!"
echo " 1. fdisk"
echo " 2. cfdisk"
echo " 3. gdisk"
echo " 4. parted"
read partitionutility

case "$partitionutility" in
  1 | fdisk | Fdisk | FDISK)
  partitionutility="fdisk"
  ;;
  2 | cfdisk | Cfdisk | CFDISK)
  partitionutility="cfdisk"
  ;;
  3 | gdisk | Gdisk | GDISK)
  partitionutility="gdisk"
  ;;
  4 | parted | Parted | PARTED)
  partitionutility="parted"
  ;;
  *)
  echo "Unknown or unsupported disk utility! Default = cfdisk."
  partitionutility="cfdisk"
  ;;
esac
echo ""$partitionutility" is the selected disk utility tool for partition."
sleep 3s
clear

echo "Getting ready for creating partitions!"
echo "root and boot partitions are mandatory."
echo "home and swap partitions are optional but recommended!"
echo "Also, you can create a separate partition for timeshift backup (optional)!"
echo "Getting ready in 9 seconds"
sleep 9s
"$partitionutility" "$drive"
clear

# - - Partition Formating Section - - #

lsblk
echo "choose your linux file system type for formatting drives"
echo " 1. ext4"
echo " 2. xfs"
echo " 3. btrfs"
echo " 4. f2fs"
read filesystemtype

case "$filesystemtype" in
  1 | ext4 | Ext4 | EXT4)
  filesystemtype="ext4"
  ;;
  2 | xfs | Xfs | XFS)
  filesystemtype="xfs"
  ;;
  3 | btrfs | Btrfs | BTRFS)
  filesystemtype="btrfs"
  ;;
  4 | f2fs | F2fs | F2FS)
  filesystemtype="f2fs"
  ;;
  *)
  echo "Unknown or unsupported Filesystem. Default = ext4."
  filesystemtype="ext4"
  ;;
esac
echo ""$filesystemtype" is the selected file system type."
sleep 3s
clear

echo -ne "
__________________________________________________________________________
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
echo "Getting ready for formatting drives."
sleep 3s
clear

# - Root Partition - #

lsblk
echo "Enter the root partition (eg: /dev/sda#): "
read rootpartition
mkfs."$filesystemtype" "$rootpartition"
mount "$rootpartition" /mnt
clear

# - Home Partition - #

lsblk
read -p "Did you also create separate home partition? [y/n]: " answerhome
case "$answerhome" in
  y | Y | yes | Yes | YES)
  echo "Enter home partition (eg: /dev/sda#): "
  read homepartition
  mkfs."$filesystemtype" "$homepartition"
  mkdir /mnt/home
  mount "$homepartition" /mnt/home
  ;;
  *)
  echo "Skipping home partition!"
  ;;
esac
clear

# - Swap Partition - #

lsblk
read -p "Did you also create swap partition? [y/n]: " answerswap
case "$answerswap" in
  y | Y | yes | Yes | YES)
  echo "Enter swap partition (eg: /dev/sda#): "
  read swappartition
  mkswap "$swappartition"
  swapon "$swappartition"
  ;;
  *)
  echo "Skipping Swap partition!"
  ;;
esac

clear

# - Boot Partition - #

lsblk
read -p "Enter the boot partition. (eg. /dev/sda#): " answerefi
mkfs.fat -F 32 "$answerefi"
sleep 3s
clear

# - - Base Installation - - #

echo -ne "
__________________________________________________________________________
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
echo "Installing Base System Files"
sleep 3s
pacstrap /mnt base curl dmidecode f2fs-tools git gpm hyperv less linux linux-atm linux-firmware linux-firmware-marvell man-db man-pages mkinitcpio mkinitcpio-nfs-utils mtools open-vm-tools pv sof-firmware sudo syslinux tmux wget efibootmgr grub broadcom-wl dhclient ethtool gnu-netcat iw iwd lynx modemmanager ndisc6 networkmanager nfs-utils openconnect openssh openvpn reflector tcpdump wireless-regdb wireless_tools wpa_supplicant wvdial cryptsetup dmraid hdparm libfido2 libusb-compat lvm2 mdadm nbd ntfs-3g nvme-cli reiserfsprogs sdparm sg3_utils smartmontools udftools usb_modeswitch usbmuxd usbutils nilfs-utils rsync testdisk vim
sleep 1s
echo "Base System Files Installation Completed..."
sleep 3s
clear


echo -ne "
__________________________________________________________________________
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
sleep 1s
echo "Generating Fstab file"
genfstab -U /mnt >> /mnt/etc/fstab
sleep 2s
clear

# - Packages Installation Section - #

echo -ne "
__________________________________________________________________________
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
echo "Executing CHROOT..."
arch-chroot /mnt
sleep 2s
clear

echo -ne "
__________________________________________________________________________
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
echo "Setting Timezone"
ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
hwclock --systohc
sleep 2s
clear

echo -ne "
__________________________________________________________________________
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
echo "generating locale"
echo "en_PH.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
sleep 2s
clear

echo -ne "
__________________________________________________________________________
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
echo "setting LANG variable"
echo "LANG=en_PH.UTF-8" > /etc/locale.conf
sleep 2s
clear

echo -ne "
__________________________________________________________________________
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
echo "setting console keyboard layout"
echo "KEYMAP=us" > /etc/vconsole.conf
sleep 2s
clear

echo -ne "
__________________________________________________________________________
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
echo "Set up your hostname!"
echo "Enter your computer name: "
read hostname
echo $hostname > /etc/hostname
echo "Checking hostname (/etc/hostname)"
cat /etc/hostname
sleep 3s
clear

echo -ne "
__________________________________________________________________________
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
echo "setting up hosts file"
echo "127.0.0.1       localhost" >> /etc/hosts
echo "::1             localhost" >> /etc/hosts
echo "127.0.1.1       $hostname" >> /etc/hosts
echo "checking /etc/hosts file"
cat /etc/hosts
sleep 3s
clear

echo -ne "
__________________________________________________________________________
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
echo "Installing A.R.C packages"
sleep 2s
pacman -Sy --needed --noconfirm xorg sddm xorg-xinput xf86-input-libinput acpi binutils fakeroot gtk-engine-murrine gvfs gvfs-mtp gvfs-afc gvfs-gphoto2 gvfs-smb gvfs-google inotify-tools make patch powertop python2 sshfs udisks2 wmctrl xclip xdotool yad bspwm sxhkd picom inetutils networkmanager-openvpn nethogs nm-connection-editor bluez bluez-utils blueman pulseaudio-bluetooth alsa-plugins alsa-tools alsa-utils pavucontrol pulseaudio pulseaudio-alsa pulseaudio-equalizer-ladspa viewnior ffmpeg ffmpegthumbnailer tumbler alacritty xfce4-terminal geany geany-plugins ranger highlight trash-cli ueberzug thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman zip p7zip unzip unrar xarchiver xdg-user-dirs xdg-user-dirs-gtk baobab dialog dunst feh lxappearance ncdu nitrogen rofi maim xfce4-power-manager xfce4-settings xsettingsd base-devel
clear

lsblk
echo "Enter the boot partition to install bootloader. (eg: /dev/sda#): "
read efipartition
efidirectory="/boot/efi/"
if [ ! -d "$efidirectory" ]; then
  mkdir -p "$efidirectory"
fi
mount "$efipartition" "$efidirectory"
clear

lsblk
sleep 2s
echo "Installing grub bootloader in /boot/efi parttiton"
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB --removable
grub-mkconfig -o /boot/grub/grub.cfg
sleep 2s
clear

echo -ne "
__________________________________________________________________________
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
echo "Enabling NetworkManager"
systemctl enable NetworkManager
sleep 2s
clear

echo -ne "
__________________________________________________________________________
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
echo "Enter password for root user:"
passwd

# - Adding User - #
echo "Adding home user!"
echo "Enter username to add a home user: "
read username
useradd -m -g users -G wheel,audio,video -s /bin/bash $username
echo "Enter password for "$username": "
passwd $username
sleep 2s

echo "Giving sudo access to "$username"!"
echo "$username ALL=(ALL) ALL" >> /etc/sudoers.d/$username
clear

echo -ne "
__________________________________________________________________________
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
sleep 1s
echo "Unmount all mounted partitions before rebooting"
sleep 5s
clear
exit