#!/bin/bash

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
echo "Entering Disk Partitioning..."
sleep 5s
clear

lsblk
echo
echo "Enter the drive to install A.R.C linux on it. (/dev/...)"
echo "Enter Drive (eg. /dev/sda or /dev/vda or /dev/nvme0n1 or something similar)"
read drive
clear

echo "Getting ready for creating partitions!"
sleep 1s
echo "root and boot partitions are mandatory."
sleep 1s
echo "home and swap partitions are optional but recommended!"
sleep 1s
echo "Also, you can create a separate partition for timeshift backup (optional)!"
sleep 1s
echo "Getting ready in 5 seconds"
sleep 5s
cfdisk "$drive"
clear

echo "Getting ready to format partitions."
sleep 3s
clear

lsblk
echo
read -p "Enter the boot partition. (eg. /dev/sda#): " answerefi
mkfs.fat -F 32 "$answerefi"
clear

lsblk
echo
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

lsblk
echo
echo "Enter the root partition (eg: /dev/sda#): "
read rootpartition
mkfs.ext4 "$rootpartition"
mount "$rootpartition" /mnt
clear

lsblk
echo
read -p "Did you also create separate home partition? [y/n]: " answerhome
case "$answerhome" in
  y | Y | yes | Yes | YES)
  echo "Enter home partition (eg: /dev/sda#): "
  read homepartition
  mkfs.ext4 "$homepartition"
  mkdir /mnt/home
  mount "$homepartition" /mnt/home
  ;;
  *)
  echo "Skipping home partition!"
  ;;
esac
clear

exec /arc-os/scripts/base-install.sh